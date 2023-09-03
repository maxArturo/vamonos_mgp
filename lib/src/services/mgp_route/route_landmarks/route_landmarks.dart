import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:vamonos_mgp/src/adapters/http/http.dart';
import 'package:vamonos_mgp/src/entities/coordinates.dart';
import 'package:vamonos_mgp/src/entities/route.dart' as entity;
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/services/mgp_route/config.dart';
import 'package:vamonos_mgp/src/services/mgp_route/models/route_locations_model.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class RouteLandMarks {
  final HttpAdapter _http;
  final String _routeApiUrl;

  RouteLandMarks(this._http, this._routeApiUrl);

  Future<Either<AppError, List<RouteLandMark>>> getAllRouteLandMarks(
      entity.Route route) async {
    return (await _http.post(
            url: _routeApiUrl,
            body:
                "accion=RecuperarRecorridoParaMapaAbrevYAmpliPorEntidadYLinea&codLinea=${route.id}&isSublinea=0",
            extraHeaders: {
              ...baseApiHeaders,
            },
            maxDuration: const Duration(days: 3)))
        .flatMap((response) {
      try {
        final rawJson = jsonDecode(response);
        final routeLandmarkList = RouteLocations.fromJson(rawJson);
        return Right(routeLandmarkList.routes
            .map((r) => RouteLandMark(
                route: entity.DirectedRoute(
                    destination: r.destination,
                    pathName: r.pathName,
                    route: route),
                isStoppingPoint: r.isCrossingPoint,
                location: Coordinate(
                    latitude: r.latitude!.toDouble(),
                    longitude: r.longitude!.toDouble())))
            .toList());
      } catch (e) {
        return Left(ParsingError(description: e.toString()));
      }
    });
  }
}
