import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vamonos_mgp/entities/transportation_mode.dart';

import '../adapters/http.dart';
import '../entities/route.dart' as entity;
import '../transformers/mgp_transportation_api/routes_by_arrival.dart';
import '../util/errors.dart';

class RouteListService {
  HttpAdapter http = HttpAdapter();
  String routeApiUrl = dotenv.env['MGP_ROUTE_API_URL']!;

  Future<Either<AppError, List<entity.Route>>> getAllAvailableRoutes() async {
    return (await http
            .post(routeApiUrl, 'accion=RecuperarLineaPorCuandoLlega', {
      // for some reason the API looks for this specifically
      'Referer': 'https://appsl.mardelplata.gob.ar/app_cuando_llega/cuando.php',
    }))
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
