import 'dart:collection';

import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers.dart';
import 'package:vamonos_mgp/src/entities/route.dart';

typedef RouteCardData
    = SplayTreeMap<String, SplayTreeMap<DirectedRoute, List<StopMarker>>>;
