import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/components/about/widget.dart';
import 'package:vamonos_mgp/src/components/home/home.dart';
import 'package:vamonos_mgp/src/components/onboard/widget.dart';
import 'package:vamonos_mgp/src/components/settings/widget.dart';
import 'package:vamonos_mgp/src/components/transportation_routes_list/routes_list.dart';
import 'package:vamonos_mgp/src/util/config_provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 200,
            child: Consumer(builder: (context, ref, child) {
              return DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Vamonos - MGP'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 30,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      Text(
                        ref.watch(configProvider).buildId,
                        style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).colorScheme.inverseSurface),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
          ListTile(
            title: listText('Mapa'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: listText('Lista de rutas'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MainRoutesPage()));
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: listText('Ver intro nuevamente'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OnboardingPage()));
            },
          ),
          ListTile(
            title: listText('acerca del app'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),
          ListTile(
            title: listText('ajustes y avanzado'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage()));
            },
          )
        ],
      ),
    );
  }

  Text listText(String listTitle) => Text(listTitle.toUpperCase(),
      style: const TextStyle(fontWeight: FontWeight.bold));
}
