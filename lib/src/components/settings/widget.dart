import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/settings/view.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => SettingsPageController();
}

class SettingsPageController extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SettingsPageView(
      this,
    );
  }
}
