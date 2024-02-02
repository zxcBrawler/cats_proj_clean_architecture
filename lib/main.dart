import 'package:cats_ca/di/service.dart';
import 'package:cats_ca/features/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
