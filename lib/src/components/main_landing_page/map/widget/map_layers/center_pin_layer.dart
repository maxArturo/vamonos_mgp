import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:url_launcher/url_launcher.dart';

nonRotatedChildren() {
  return [
    const Center(
        child: Icon(
      Icons.location_on_sharp,
      color: Colors.black,
      size: 40,
      weight: 800,
    )),
    AttributionWidget.defaultWidget(
      alignment: const Alignment(0.0, 0.6),
      source: 'OpenStreetMap contributors',
      onSourceTapped: () =>
          launchUrl(Uri.https('www.openstreetmap.org', '/fixthemap')),
    ),
  ];
}
