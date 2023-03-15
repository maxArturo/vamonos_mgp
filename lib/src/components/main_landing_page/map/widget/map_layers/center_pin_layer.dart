import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/map/markers/markers_provider.dart';

nonRotatedChildren() {
  return [
    Consumer(builder: (context, ref, child) {
      return ref.watch(allMarkersProvider).maybeWhen(
          loading: () => Center(
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Loading stops... please wait",
                          style: TextStyle(
                              color: Color.fromARGB(255, 10, 23, 28),
                              fontSize: 15),
                        ),
                        SizedBox(width: 20),
                        SpinKitWave(
                          color: Colors.blue,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
          data: (_) => const Center(
                  child: Icon(
                Icons.location_on_sharp,
                color: Colors.black,
                size: 40,
                weight: 800,
              )),
          orElse: () => const Text("error here"));
    }),
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
