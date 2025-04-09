import 'package:exchange_app/core/app/app.dart';
import 'package:exchange_app/core/di/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await configureInjection();
  runApp(const App());
}