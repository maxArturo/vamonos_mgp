import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AttributionLayer extends StatelessWidget {
  final bool dockToBottom;
  const AttributionLayer({super.key, this.dockToBottom = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, dockToBottom ? 0.8 : 0.57),
      child: ColoredBox(
        color: const Color(0xCCFFFFFF),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: GestureDetector(
                onTap: () => launchUrl(Uri.https('appsl.mardelplata.gob.ar',
                    'app_cuando_llega/web/cuando.php')),
                child: const Padding(
                  padding: EdgeInsets.all(3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
            FittedBox(
              fit: BoxFit.scaleDown,
              child: GestureDetector(
                onTap: () =>
                    launchUrl(Uri.https('www.openstreetmap.org', '/fixthemap')),
                child: const Padding(
                  padding: EdgeInsets.all(3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
          ],
        ),
      ),
    );
  }
}
