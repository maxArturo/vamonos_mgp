import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vamonos_mgp/src/components/about/widget.dart';
import 'package:vamonos_mgp/src/components/common/about_section.dart';
import 'package:vamonos_mgp/src/components/common/attribution/government.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/navigation/drawer.dart';
import 'package:vamonos_mgp/src/components/onboard/widget.dart';

class AboutPageView extends WidgetView<AboutPage, AboutPageController> {
  const AboutPageView(
    super.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Acerca de este app'.toUpperCase(),
                style: const TextStyle(color: Colors.white)),
          ),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        drawer: const HomeDrawer(),
        body: ListView(
          children: [
            const SizedBox(
              height: 18.0,
            ),
            AboutSection(
                title: "*** AVISO ***",
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: govSourceCopy,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    govSourceLink(
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ))),
            AboutSection(
              title: "¿Cómo uso el app de nuevo?",
              child: RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Podés ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: 'volver a ver el intro',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OnboardingPage()));
                      },
                  ),
                  TextSpan(
                    text: ' para familiarizarte con la funcionalidad del app.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              )),
            ),
            const AboutSection(
              title: "¿Porqué hiciste este app?",
              bodyText:
                  "Me costaba trabajo acordarme de las calles y contraesquinas. Me imaginaba que otras personas también "
                  "tendrían ese problema, y en una parada oí a dos chicas que se quejaban de lo complicado que era. "
                  "¡Y se me ocurrió armar un app por si más personas le sacaban provecho!",
            ),
            const AboutSection(
              title:
                  "Y ¿qué onda con el app oficial? ¿Es competencia o cómo es?",
              bodyText:
                  "En realidad no. De hecho el app oficial y éste usan los mismos datos del Municipio para las línas y "
                  "arribos. Por lo mismo, si sale mal data o el municipio decide cerrar acceso a los datos el app no va a "
                  "andar bien.\n\n"
                  "Es más que nada una alternativa para que los usuarios del transporte público usen los datos "
                  "ya existentes de forma fácil y rápida.",
            ),
            const AboutSection(
                title: "¿Porqué un app más, si ya hay otras alternativas?",
                bodyText:
                    "Probé usar otras apps y no me gustaron por varias cosas: \n"
                    "- tienen ads \n"
                    "- no son fáciles de usar\n"
                    "- no son de tiempo real \n"
                    "Si no te gustan esas cosas, puede te guste este app en vez."),
            const AboutSection(
              title:
                  "No hay nada grátis en la vida. ¿Qué datos míos estás usando?",
              bodyText:
                  "El app no colecta ningún dato tuyo identificable. Se analizan estadísticas en agregado para saber si "
                  "estamos sobrecargando los servidores del Municipio o de OpenStreetMap (lo del mapita). No quiero que se calienten y cierren el acceso, así que mejor "
                  "estar al tanto.",
            ),
            const AboutSection(
              title:
                  "Me encontré problemas, tengo sugerencias o te quiero comprar una birra. ¿Cómo hago?",
              bodyText:
                  "Podés mandarme un mail con el botón de abajo. Si viste un error o algo manda mal, por favor describe lo que "
                  "estabas haciendo con el mayor detalle posible y lo trataré de identificar. Si te gustó el app, también mandame "
                  "mail, me encantaría saber tu opinión!",
            ),
            Center(
              child: ElevatedButton.icon(
                  onPressed: () =>
                      launchUrlString("mailto:92l1ax1sq@mozmail.com"),
                  icon: const Icon(
                    Icons.mail,
                    color: Colors.blue,
                  ),
                  label: const Text("manda email")),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ));
  }
}
