import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vamonos_mgp/entities/transportation_mode.dart';

import '../adapters/http.dart';
import '../entities/route.dart';
import '../util/errors.dart';

class RouteListService {
  HttpAdapter http = HttpAdapter();
  String routeApiUrl = dotenv.env['MGP_ROUTE_API_URL']!;

  Future<Either<AppError, List<Route>>> getAllAvailableRoutes() async {
    return (await http
            .post(routeApiUrl, 'accion=RecuperarLineaPorCuandoLlega', {
      'Referer': 'https://appsl.mardelplata.gob.ar/app_cuando_llega/cuando.php',
    }))
        .map((res) {
      final rawRouteList = res['lineas'] as List<dynamic>;
      return rawRouteList
          .map((e) =>
              Route(TransportationMode.bus, e['Descripcion'], e['Descripcion']))
          .toList();
    });
  }
}
