import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DefaultResetMapbutton extends ConsumerWidget {
  const DefaultResetMapbutton({super.key, required this.recenterLocation});

  final void Function() recenterLocation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => recenterLocation(),
      child: const Text("Llevar a centro de zona de cobertura"),
    );
  }
}
