import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/adapters/filesystem/persisted_state_provider.dart';
import 'package:vamonos_mgp/src/components/common/error_sink.dart';
import 'package:vamonos_mgp/src/components/home/home.dart';
import 'package:vamonos_mgp/src/components/onboard/widget.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class SpringboardWidget extends ConsumerWidget {
  const SpringboardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eitherState = ref.watch(persistedStateProvider);
    return eitherState.fold(
        data: (appState) =>
            appState.demoDisplayed ? const HomePage() : const OnboardingPage(),
        error: (err) => errorSink(err, widget: const OnboardingPage()),
        loading: () => const SizedBox.shrink());
  }
}
