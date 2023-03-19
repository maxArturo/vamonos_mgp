import 'package:flutter/material.dart';

final validColors =
    Colors.primaries.where((color) => color != Colors.yellow).toList();

class ListCard extends StatelessWidget {
  final Color? color;
  final void Function()? onPressed;
  final String topRowText;
  final Widget? bottomWidget;

  const ListCard({
    this.bottomWidget,
    required this.topRowText,
    super.key,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: double.infinity,
        child: RawMaterialButton(
          fillColor:
              color ?? validColors[topRowText.hashCode % validColors.length],
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                  fit: BoxFit.contain,
                  child: Text(topRowText.toUpperCase(),
                      style:
                          const TextStyle(color: Colors.white, fontSize: 40))),
              ...(bottomWidget != null
                  ? [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: bottomWidget,
                      )
                    ]
                  : []),
            ],
          ),
        ));
  }
}
