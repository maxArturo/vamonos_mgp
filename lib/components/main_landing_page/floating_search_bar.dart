import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vamonos_mgp/components/main_landing_page/home/home_provider.dart';
import 'package:vamonos_mgp/providers/location.dart';

class FloatingSearchBar extends StatelessWidget {
  const FloatingSearchBar({
    super.key,
    required double panelHeightOpen,
    required double fabHeight,
    required double panelHeightClosed,
    required PanelController panelController,
  })  : _panelHeightOpen = panelHeightOpen,
        _fabHeight = fabHeight,
        _panelHeightClosed = panelHeightClosed,
        _panelController = panelController;

  final double _panelHeightOpen;
  final double _fabHeight;
  final double _panelHeightClosed;
  final PanelController _panelController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // these pixel dimensions below (left, right) ensure boundaries
      // for the poisitioned search bars
      left: 20,
      right: 20,
      top: max(MediaQuery.of(context).padding.top,
          _panelHeightOpen - _fabHeight - _panelHeightClosed),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<LocationProviderStore>(context, listen: false)
                  .recenterMapLocation();
            },
            backgroundColor: Colors.white,
            child: Icon(
              Icons.near_me_sharp,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              maxLines: 1,
              keyboardType: TextInputType.streetAddress,
              onTap: () {
                Provider.of<HomeComponentProvider>(context, listen: false)
                    .setSearchBarFocused(true);
                Provider.of<HomeComponentProvider>(context, listen: false)
                    .setDisplayedPanel(BottomPanel.searchMenu);
                _panelController.animatePanelToPosition(
                  1.0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              decoration: InputDecoration(
                hintText: "Where do you want to go?",
                filled: true,
                fillColor: Colors.amber,
                prefixIcon:
                    Icon(Icons.search, color: Theme.of(context).primaryColor),
                border: const UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
