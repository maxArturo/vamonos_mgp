import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/entities/route_landmark.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'stops_within_bounds_provider.g.dart';

@riverpod
Stream<Either<AppError, List<RouteLandMark>>> stopsWithinMapBounds(
    StopsWithinMapBoundsRef ref) async* {
  final allStops = await ref.watch(AllLandMarksBySourceProvider(
          provider: TransportationProvider.municipioGeneralPurreydon)
      .future);

  final mapEventStream = ref.watch(mapOnEndEventStreamProvider.stream);

  await for (final event in mapEventStream) {
    yield allStops.flatMap((stopList) {
      return catching(() => stopList
          .where((stop) => event.bounds!.contains(
              LatLng(stop.location.latitude!, stop.location.longitude!)))
          .toList()).leftMap((e) => ParsingError(description: e.toString()));
    });
  }
}
