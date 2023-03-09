import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/adapters/http/http.dart';
import 'package:vamonos_mgp/src/entities/route.dart' as entity;
import 'package:vamonos_mgp/src/entities/route_stop_landmark.dart';
import 'package:vamonos_mgp/src/services/mgp_route/config.dart';
import 'package:vamonos_mgp/src/services/mgp_route/models/route_stop_locations_model.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class RouteStopLandMarks {
  final HttpAdapter _http;

  RouteStopLandMarks(this._http);

  String routeApiUrl = dotenv.env['MGP_ROUTE_API_URL']!;

  Future<Either<AppError, List<RouteStopLandMark>>> getAllStopLocations(
      entity.Route route) async {
    return (await _http.post(
            url: routeApiUrl,
            body:
                "accion=RecuperarRecorridoParaMapaAbrevYAmpliPorEntidadYLinea&codLinea=${route.id}&isSublinea=0",
            extraHeaders: {
              ...baseApiHeaders,
            },
            maxDuration: const Duration(days: 1)))
        .flatMap((response) {
      try {
        final rawJson = jsonDecode(response);
        final routeStopList = RouteStopLocations.fromJson(rawJson);
        return Right(routeStopList.routes.map((r) {
          final bigAns = RouteStopLandMark(
              route: entity.DirectedRoute(
                  direction: r.routeDirection, route: route),
              isStoppingPoint: r.isCrossingPoint,
              location: LocationData.fromMap(
                  {'latitude': r.latitude, 'longitude': r.longitude}));
          return bigAns;
        }).toList());
      } catch (e) {
        return Left(ParsingError());
      }
    });
  }
}
