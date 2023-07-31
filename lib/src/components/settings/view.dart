import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vamonos_mgp/src/adapters/cache/cache_provider.dart';
import 'package:vamonos_mgp/src/adapters/filesystem/persisted_state_provider.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/navigation/drawer.dart';
import 'package:vamonos_mgp/src/components/settings/widget.dart';

class SettingsPageView
    extends WidgetView<SettingsPage, SettingsPageController> {
  const SettingsPageView(
    super.state, {
    super.key,
  });

  void confirmAndClearCache(BuildContext context) async {
    showPlatformDialog(
        context: context, builder: (_) => const CacheClearAlert());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Ajustes y opciones avanzadas'.toUpperCase(),
                style: const TextStyle(color: Colors.white)),
          ),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        drawer: const HomeDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 18.0,
                ),
                Row(
                  children: [
                    const Flexible(
                        child: Text("Borrar datos almacenados y cache")),
                    const SizedBox(
                      width: 15.0,
                    ),
                    ElevatedButton.icon(
                        onPressed: () => confirmAndClearCache(context),
                        icon: const FaIcon(
                          FontAwesomeIcons.trash,
                          // size: 35,
                          color: Colors.red,
                        ),
                        label: const Text("Borrar")),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class CacheClearAlert extends ConsumerWidget {
  const CacheClearAlert({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformAlertDialog(
      title: const Text('AVISO'),
      content: const Text(
          "Borrar el cache obligará al app a obtener los datos de "
          "mapas y rutas de nuevo, lo cual puede tardar unos minutos. ¿Está seguro?"),
      actions: [
        PlatformDialogAction(
            child: PlatformText(
              'Cancelar',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        PlatformDialogAction(
            child: PlatformText('Continuar'),
            onPressed: () async {
              Navigator.of(context).pop();
              final cache = ref.read(cacheAdapterProvider);
              debugPrint("[DEBUG] clearing cache...");
              cache.clearCache();
              ref.read(persistedStateProvider.notifier).clearFile();
              debugPrint("[DEBUG] clearing cache complete.");
              showPlatformDialog(
                  context: context,
                  builder: (_) => const CacheClearConfirmation());
            }),
      ],
    );
  }
}

class CacheClearConfirmation extends StatelessWidget {
  const CacheClearConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      title: const Text('AVISO'),
      content: const Text("El cache ha sido borrado."),
      actions: [
        PlatformDialogAction(
            child: PlatformText(
              'Aceptar',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
