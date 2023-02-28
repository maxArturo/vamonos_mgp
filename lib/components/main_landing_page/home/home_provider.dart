import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vamonos_mgp/components/main_landing_page/routes_near_you_list/widget.dart';

import '../search_menu.dart';

enum BottomPanel {
  routeList,
  searchMenu,
}

class HomeComponentProvider with ChangeNotifier {
  var _searchBarIsFocused = false;
  var _displayedPanel = BottomPanel.routeList;
  var _drawerDraggable = true;
  final PanelController _panelController = PanelController();

  get searchBarFocused => _searchBarIsFocused;
  get displayedPanel => _displayedPanel;
  get drawerDraggable => _drawerDraggable;
  PanelController get panelController => _panelController;

  setSearchBarFocused(bool focused) {
    _searchBarIsFocused = focused;
    notifyListeners();
  }

  setDisplayedPanel(BottomPanel panel) {
    if (panel == BottomPanel.routeList) {
      _displayedPanel = BottomPanel.routeList;
      _drawerDraggable = true;
    } else if (panel == BottomPanel.searchMenu) {
      _displayedPanel = BottomPanel.searchMenu;
      _drawerDraggable = false;
    } else {
      throw UnsupportedError("Invalid panel provided");
    }

    _panelController
        .animatePanelToPosition(0.8,
            duration: const Duration(milliseconds: 500), curve: Curves.linear)
        .then((_) => notifyListeners());
  }
}
