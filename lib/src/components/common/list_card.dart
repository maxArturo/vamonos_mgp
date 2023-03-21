import 'package:flutter/material.dart';

final validColors =
    Colors.primaries.where((color) => color != Colors.yellow).toList();

/// provides an easy way to show raw material buttons inside lists with a
/// sane set of default colors.
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
    return ConstrainedBox(
        constraints: BoxConstraints.loose(const Size(double.maxFinite, 100)),
        child: RawMaterialButton(
          fillColor:
              color ?? validColors[topRowText.hashCode % validColors.length],
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(topRowText.toUpperCase(),
                      style:
                          const TextStyle(color: Colors.white, fontSize: 40)),
                ),
              ),
              if (bottomWidget != null)
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: bottomWidget,
                ),
            ],
          ),
        ));
  }
}
