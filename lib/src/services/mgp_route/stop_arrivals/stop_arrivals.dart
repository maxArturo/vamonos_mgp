import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vamonos_mgp/src/adapters/http/http.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/entities/stop_arrival.dart';
import 'package:vamonos_mgp/src/services/mgp_route/config.dart';
import 'package:vamonos_mgp/src/services/mgp_route/models/stop_arrivals_model.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class StopArrivalService {
  final HttpAdapter _http;

  StopArrivalService(this._http);

  String routeApiUrl = dotenv.env['MGP_ROUTE_API_URL']!;

  Future<Either<AppError, List<StopArrival>>> getAllStopArrivals(
      RouteStop stop) async {
    return (await _http.post(
            url: routeApiUrl,
            body:
                "accion=RecuperarProximosArribosW&identificadorParada=${stop.name}&codigoLineaParada=${stop.route.id}",
            extraHeaders: {
              ...baseApiHeaders,
            },
            maxDuration: const Duration(minutes: 1)))
        .flatMap((response) {
      try {
        final rawJson = jsonDecode(response);
        final stopArrivals = StopArrivals.fromJson(rawJson);

        if (stopArrivals.statusCode != 0) {
          if (stopArrivals.statusMessage
              .toLowerCase()
              .contains("sin datos disponibles")) {
            return Left(
                DataNotFoundError(description: stopArrivals.statusMessage));
          }
          return Left(
              ServiceUnavailableError(description: stopArrivals.statusMessage));
        }
        if (stopArrivals.stops == null) {
          return Left(DataNotFoundError(
              description: "non-error code, but no stops returned from API"));
        }

        return Right(stopArrivals.stops!.map((arrival) {
          return StopArrival(stop: stop, arrival: arrival.arrival);
        }).toList());
      } catch (e) {
        return Left(ParsingError(description: e.toString()));
      }
    });
  }
}
