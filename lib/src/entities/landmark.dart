import 'package:vamonos_mgp/src/entities/coordinate.dart';

class LandMark implements Comparable<LandMark> {
  final Coordinate location;

  LandMark({required this.location});

  @override
  int compareTo(LandMark other) {
    return location.compareTo(other.location);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is LandMark && other.runtimeType == runtimeType) {
      return location == other.location;
    }
    return false;
  }

  @override
  int get hashCode => location.hashCode;
}
