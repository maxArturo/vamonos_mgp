import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/adapters/http/http.dart';
import 'package:vamonos_mgp/src/entities/route.dart' as entity;
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/services/mgp_route/config.dart';
import 'package:vamonos_mgp/src/services/mgp_route/models/route_stops_model.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class RouteStopService {
  final HttpAdapter _http;

  RouteStopService(this._http);

  String routeApiUrl = dotenv.env['MGP_ROUTE_API_URL']!;

  Future<Either<AppError, List<RouteLandMark>>> getAllRouteStops(
      entity.Route route) async {
    return (await _http.post(
            url: routeApiUrl,
            body:
                "accion=RecuperarParadasConBanderaYDestinoPorLinea&codLinea=${route.id}&isSublinea=0",
            extraHeaders: {
              ...baseApiHeaders,
            },
            maxDuration: const Duration(days: 3)))
        .flatMap((response) {
      try {
        final rawJson = jsonDecode(response);
        final routeStopList = RouteStops.fromJson(rawJson);
        return Right(routeStopList.stops.map((stop) {
          final routeStop = RouteStop(
              route: entity.DirectedRoute(
                  direction: stop.stopAbbreviatedDirection, route: route),
              location: LocationData.fromMap(
                  {'latitude': stop.latitude, 'longitude': stop.longitude}),
              abbrevDirection: stop.stopAbbreviatedDirection,
              description: stop.description,
              extendedDirection: stop.stopExtendedDirection,
              id: stop.stopCode,
              name: stop.stopIdentifier);
          return routeStop;
        }).toList());
      } catch (e) {
        return Left(ParsingError());
      }
    });
  }
}
