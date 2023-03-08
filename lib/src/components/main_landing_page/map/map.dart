import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/widget/widget_provider.dart';

class NavigationMap extends ConsumerWidget {
  const NavigationMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(navigationMapViewWidgetProvider);
  }
}
