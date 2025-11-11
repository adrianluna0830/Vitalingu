import 'package:flutter/material.dart';
import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Sembast with Injectable')),
        body: Center(child: Text('App Initialized')),
      ),
    );
  }
}

