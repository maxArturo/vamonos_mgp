import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/app.dart';

Future<void> main() async {
  await dotenv.load(fileName: kReleaseMode ? ".env.prod" : ".env");
  runApp(const ProviderScope(child: App()));
}
