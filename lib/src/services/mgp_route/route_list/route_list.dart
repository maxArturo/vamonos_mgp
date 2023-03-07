import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vamonos_mgp/src/adapters/http/http.dart';
import 'package:vamonos_mgp/src/entities/route.dart' as entity;
import 'package:vamonos_mgp/src/entities/transportation_mode.dart';
import 'package:vamonos_mgp/src/services/mgp_route/config.dart';
import 'package:vamonos_mgp/src/services/mgp_route/models/routes_by_arrival_model.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class RouteListService {
  final HttpAdapter _http;

  RouteListService(this._http);

  String routeApiUrl = dotenv.env['MGP_ROUTE_API_URL']!;

  Future<Either<AppError, List<entity.Route>>> getAllAvailableRoutes() async {
    return (await _http.post(
            url: routeApiUrl,
            body: 'accion=RecuperarLineaPorCuandoLlega',
            extraHeaders: {
              ...baseApiHeaders,
            },
            maxDuration: const Duration(seconds: 30)))
        .map((res) {
      final rawJson = jsonDecode(res);
      final apiRouteList = RoutesByArrival.fromJson(rawJson);
      return apiRouteList.routes
          .map((e) => entity.Route(
              TransportationMode.bus, e.description, e.description))
          .toList();
    });
  }
}
