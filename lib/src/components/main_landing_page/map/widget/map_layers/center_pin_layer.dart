import 'package:flutter/material.dart';
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
    Align(
      alignment: const Alignment(0.0, 0.57),
      child: ColoredBox(
        color: const Color(0xCCFFFFFF),
        child: GestureDetector(
          onTap: () => launchUrl(Uri.https(
              'appsl.mardelplata.gob.ar', 'app_cuando_llega/web/cuando.php')),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "MGP/Cuando Llega",
                    style: TextStyle(color: Color(0xFF0078a8)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    Align(
      alignment: const Alignment(0.0, 0.65),
      child: ColoredBox(
        color: const Color(0xCCFFFFFF),
        child: GestureDetector(
          onTap: () =>
              launchUrl(Uri.https('www.openstreetmap.org', '/fixthemap')),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "OpenStreetMap",
                    style: TextStyle(color: Color(0xFF0078a8)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
  ];
}
