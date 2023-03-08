import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/app.dart';
import 'package:vamonos_mgp/src/util/logs.dart';

Future main() async {
  configureApp();
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: App()));
}
