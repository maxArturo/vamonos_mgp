import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// see https://blog.gskinner.com/archives/2020/02/flutter-widgetview-a-simple-separation-of-layout-and-logic.html
abstract class WidgetView<T1, T2> extends StatelessWidget {
  final T2 state;
  const WidgetView(this.state, {super.key});

  T1 get widget => (state as State).widget as T1;

  @override
  Widget build(BuildContext context);
}

abstract class ConsumerWidgetView<T1, T2> extends ConsumerWidget {
  final T2 state;
  const ConsumerWidgetView(this.state, {super.key});

  T1 get widget => (state as State).widget as T1;

  @override
  Widget build(BuildContext context, WidgetRef ref);
}
