import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vamonos_mgp/src/components/common/map/markers/markers_provider.dart';
import 'package:vamonos_mgp/src/components/common/toast.dart';
import 'package:vamonos_mgp/src/util/extensions/riverpod.dart';

class StopsCenterPinLayer extends ConsumerWidget {
  const StopsCenterPinLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(allMarkersProvider).fold(
          data: (_) => const Center(
              child: Icon(
            Icons.gps_fixed_sharp,
            color: Colors.black,
            size: 40,
            weight: 800,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
