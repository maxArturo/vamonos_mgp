import 'dart:math';

/// This class contains domain-owned logic for operations and comparison of
/// coordinates. A lot of logic is replicated here for purposes of not depending
/// on other classes/packages for simple coordinate logic (such as [LatLng]).
class Coordinate {
  final double latitude;
  final double longitude;

  Coordinate({required this.latitude, required this.longitude});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Coordinate &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  int compareTo(Coordinate other) {
    final latComparison = latitude.compareTo(other.latitude);
    final longComparison = longitude.compareTo(other.longitude);
    return latComparison - longComparison;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  /// Haversine formula to calculate the distance between two coordinates
  double distanceTo(Coordinate other) {
    var radius = 6371; // Radius of the Earth in kilometers

    var dLat = _degreesToRadians(other.latitude - latitude);
    var dLon = _degreesToRadians(other.longitude - longitude);

    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(latitude)) *
            cos(_degreesToRadians(other.latitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    var c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return radius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }
}
