import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/entities/route.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_controller_provider.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

part 'markers_provider.g.dart';

@riverpod
Future<Either<AppError, List<StopMarker>>> allMarkers(AllMarkersRef ref) async {
  final allLandmarksResponse = ref.watch(allLandMarksBySourceProvider(
      provider: TransportationProvider.municipioGeneralPurreydon));

  return allLandmarksResponse.maybeWhen(
      data: (data) {
        final response = data.flatMap<List<StopMarker>>((landmarks) {
          try {
            final theThing = landmarks
                .where((el) =>
                    el.location.latitude != null &&
                    el.location.longitude != null &&
                    !el.isStoppingPoint)
                .map((landmark) => StopMarker(
                    stopName: landmark.route.direction, landmark: landmark))
                .toList();
            return Right(theThing);
          } catch (e) {
            return Left(ParsingError());
          }
        });
        return response;
      },
      loading: () => const Right([]),
      orElse: () => Left(UntypedError()));
}

final markersWithinMapBoundsProvider =
    StreamProvider.autoDispose<Either<AppError, List<StopMarker>>>(
        (AutoDisposeRef ref) async* {
  final allMarkers = await ref.watch(allMarkersProvider.future);

  final mapEventStream = ref.watch(mapOnEndEventStreamProvider.stream);

  await for (final event in mapEventStream) {
    yield allMarkers.flatMap((markerList) {
      return catching(() => markerList
          .where((marker) => event.bounds!.contains(LatLng(
              marker.landmark.location.latitude!,
              marker.landmark.location.longitude!)))
          .toList()).leftMap((_) => ParsingError());
    });
  }
});
