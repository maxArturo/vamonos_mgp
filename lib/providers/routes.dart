import 'package:vamonos_mgp/adapters/http.dart';

import '../entities/route.dart';

class RouteProviderStore {
  HttpAdapter http = HttpAdapter();

  // WIP
  Future<List<Route>> getAllAvailableRoutes() {
    http.post(url, body)
  }
}
