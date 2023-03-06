import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/components/main_landing_page/home.dart';
import 'package:vamonos_mgp/src/components/transportation_routes_list/routes_list.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 150,
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
          ),
          ListTile(
            title: Text('Map Search'.toUpperCase()),
            onTap: () {
              debugPrint("map search tapped");
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Route List'.toUpperCase()),
            onTap: () {
              debugPrint("route list tapped");
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MainRoutesPage()));
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('About'.toUpperCase()),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
