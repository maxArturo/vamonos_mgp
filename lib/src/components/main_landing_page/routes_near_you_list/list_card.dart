import 'package:flutter/material.dart';

class PanelListCard extends StatelessWidget {
  final Color color;
  final void Function()? onPressed;
  final String topRowText;
  final String bottomRowText;

  const PanelListCard({
    required this.bottomRowText,
    required this.topRowText,
    super.key,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: double.infinity,
        child: RawMaterialButton(
          fillColor: color,
          onPressed: onPressed,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(topRowText.toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                      Text(bottomRowText.toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const Icon(Icons.directions_bus_filled_sharp,
                      size: 24, color: Colors.white),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
