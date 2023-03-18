import 'package:flutter/material.dart';

class PanelListCard extends StatelessWidget {
  final Color color;
  final void Function()? onPressed;
  final String topRowText;
  final Widget? bottomWidget;

  const PanelListCard({
    this.bottomWidget,
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
