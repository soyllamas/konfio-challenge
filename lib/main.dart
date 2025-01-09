import 'package:flutter/material.dart';
import 'package:konfio_challenge/app/app.dart';
import 'package:konfio_challenge/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();
  runApp(const KonfioApp());
}
