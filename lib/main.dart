import 'package:flutter/material.dart';
import 'di.dart';
import 'package:vitalingu/views/settings_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SettingsView(),
    );
  }
}

