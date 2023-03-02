import 'package:dartz/dartz.dart';
import 'package:vamonos_mgp/services/mgp_route_api/route_list_service.dart';

import '../entities/route.dart';
import '../util/errors.dart';

class RouteProviderStore {
  final _service = RouteListService();

  Future<Either<AppError, List<Route>>> allRoutes() =>
      _service.getAllAvailableRoutes();
}
