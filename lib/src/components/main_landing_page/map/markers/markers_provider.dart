import 'package:dartz/dartz.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/entities/transportation_provider.dart';
import 'package:vamonos_mgp/src/services/map/landmark_provider.dart';
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
                .map((landmark) =>
                    StopMarker(stopName: "NO NAME YET", landmark: landmark))
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
