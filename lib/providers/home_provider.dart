import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

enum BottomPanel {
  routeList,
  searchMenu,
}

class HomeComponentProvider with ChangeNotifier {
  final PanelController _panelController = PanelController();

  PanelController get panelController => _panelController;
}
