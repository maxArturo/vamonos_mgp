import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/adapters/cache/cache_provider.dart';
import 'package:vamonos_mgp/src/adapters/filesystem/persisted_state_provider.dart';
import 'package:vamonos_mgp/src/components/about/widget.dart';
import 'package:vamonos_mgp/src/components/home/home.dart';
import 'package:vamonos_mgp/src/components/onboard/widget.dart';
import 'package:vamonos_mgp/src/components/transportation_routes_list/routes_list.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 150,
            child: Consumer(builder: (context, ref, child) {
              return GestureDetector(
                onTap: () async {
                  if (!kReleaseMode) {
                    final cacheClear = ref.read(cacheAdapterProvider);
                    debugPrint("[DEBUG] tapping to clear cache");
                    cacheClear.clearCache();
                    await ref.read(persistedStateProvider.notifier).clearFile();
                  }
                },
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Vamonos - MGP'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
              );
            }),
          ),
          ListTile(
            title: Text('Mapa'.toUpperCase()),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Lista de rutas'.toUpperCase()),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MainRoutesPage()));
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('acerca del app'.toUpperCase()),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),
          ListTile(
            title: Text('Ver intro nuevamente'.toUpperCase()),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OnboardingPage()));
            },
          ),
        ],
      ),
    );
  }
}
