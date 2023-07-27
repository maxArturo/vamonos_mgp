import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

TextSpan govSourceLink({TextStyle? style}) => TextSpan(
      text: "Cuando Llega - Mar del Plata",
      style: (style ?? const TextStyle()).copyWith(color: Colors.blue),
      recognizer: TapGestureRecognizer()
        ..onTap = () => launchUrl(Uri.https(
            'appsl.mardelplata.gob.ar', '/app_cuando_llega/web/cuando.php')),
    );

const String govSourceCopy =
    "Este app no está vinculado ni pertenece a ninguna entidad de gobierno.\n\n"
    "Los datos son aproximados únicamente, y provienen de la fuente del municipio en el siguiente link: ";
