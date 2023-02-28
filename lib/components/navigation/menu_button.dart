import 'package:flutter/material.dart';

class FloatingMenuButton extends StatelessWidget {
  const FloatingMenuButton({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Positioned(
        top: mediaQuery.padding.top + 15,
        left: mediaQuery.padding.left + 15,
        child: FloatingActionButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            backgroundColor: Colors.white,
            heroTag: UniqueKey(),
            child: Icon(Icons.menu, color: Theme.of(context).primaryColor)));
  }
}
