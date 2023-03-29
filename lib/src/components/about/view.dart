import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/about/widget.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/navigation/drawer.dart';

class AboutPageView extends WidgetView<AboutPage, AboutPageController> {
  const AboutPageView(
    super.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text('About'.toUpperCase(),
              style: const TextStyle(color: Colors.white)),
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      drawer: const HomeDrawer(),
      body: const Placeholder(),
    );
  }
}
