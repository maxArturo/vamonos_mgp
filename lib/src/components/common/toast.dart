import 'package:flutter/material.dart';

class BaseToast extends StatelessWidget {
  final String toastText;
  const BaseToast({super.key, required this.toastText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                toastText,
              )),
        ],
      ),
    );
  }
}
