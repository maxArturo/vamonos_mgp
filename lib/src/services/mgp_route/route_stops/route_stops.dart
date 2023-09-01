import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:vamonos_mgp/src/adapters/http/http.dart';
import 'package:vamonos_mgp/src/entities/coordinates.dart';
import 'package:vamonos_mgp/src/entities/route.dart' as entity;
import 'package:vamonos_mgp/src/entities/route_stop.dart';
import 'package:vamonos_mgp/src/services/mgp_route/config.dart';
import 'package:vamonos_mgp/src/services/mgp_route/models/route_stops_model.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class RouteStopService {
  final HttpAdapter _http;
  final String _routeApiUrl;

  RouteStopService(this._http, this._routeApiUrl);

  Future<Either<AppError, List<RouteStop>>> getAllRouteStops(
      entity.Route route) async {
    return (await _http.post(
            url: _routeApiUrl,
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
        return Right(routeStopList.stops.values
            .map((stops) {
              final routeStops = stops
                  .where((el) => el.latitude != null && el.longitude != null)
                  .map((stop) {
                return RouteStop(
                    route: entity.DirectedRoute(
                        destination: stop.destination,
                        pathName: stop.pathName,
                        route: route),
                    location: Coordinate(
                        latitude: stop.latitude!.toDouble(),
                        longitude: stop.longitude!.toDouble()),
                    description: stop.description,
                    id: stop.stopCode,
                    name: stop.stopIdentifier);
              }).toList();
              return routeStops;
            })
            .reduce((value, element) => [...value, ...element])
            .toList());
      } catch (e) {
        return Left(ParsingError(description: e.toString()));
      }
    });
  }
}
