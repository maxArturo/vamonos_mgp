import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/http/http_provider.dart';
import 'package:vamonos_mgp/src/entities/route.dart' as entity;
import 'package:vamonos_mgp/src/services/mgp_route/route_list/route_list.dart';
import 'package:vamonos_mgp/src/util/config_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'route_list_provider.g.dart';

@riverpod
RouteListService routeList(RouteListRef ref) {
  return RouteListService(
      ref.watch(httpAdapterProvider), ref.watch(configProvider).mgpApiUrl);
}

final latestRouteListProvider =
    FutureProvider.autoDispose<Either<AppError, List<entity.Route>>>(
        (ref) => ref.watch(routeListProvider).getAllAvailableRoutes());
