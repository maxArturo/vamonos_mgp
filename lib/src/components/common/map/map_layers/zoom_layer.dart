import 'package:flutter/material.dart';

class ZoomGaugeLayer extends StatelessWidget {
  final double? currZoom;

  const ZoomGaugeLayer({this.currZoom, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Align(
            alignment: Alignment.topLeft, child: Text(currZoom.toString())));
  }
}
