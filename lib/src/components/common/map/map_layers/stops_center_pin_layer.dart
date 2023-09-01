import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vamonos_mgp/src/components/common/toast.dart';
import 'package:vamonos_mgp/src/services/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class StopsCenterPinLayer extends ConsumerWidget {
  const StopsCenterPinLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(allMarkersMGPProvider).fold(
          data: (_) => const Center(
              child: FaIcon(
            FontAwesomeIcons.circleDot,
            size: 35,
            color: Colors.black,
          )),
          error: (e) => errorSink(e),
          loading: () => Center(
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width / 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xCCFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Cargando paradas... espere",
                      style: TextStyle(
                          color: Color.fromARGB(255, 10, 23, 28), fontSize: 15),
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
        );
  }
}
