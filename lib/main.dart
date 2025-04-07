import 'package:exchange_app/core/app/app.dart';
import 'package:exchange_app/core/di/injectable.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const App());
}