import 'package:dartz/dartz.dart';
import 'package:vamonos_mgp/src/adapters/http/http_provider.dart';
import 'package:vamonos_mgp/src/entities/route.dart' as entity;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/services/mgp_route/route_list.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'route_list_provider.g.dart';

@Riverpod(keepAlive: true)
RouteListService routeList(RouteListRef ref) {
  return RouteListService(ref.watch(httpAdapterProvider));
}

final latestRouteListProvider =
    FutureProvider.autoDispose<Either<AppError, List<entity.Route>>>(
        (ref) => ref.watch(routeListProvider).getAllAvailableRoutes());
