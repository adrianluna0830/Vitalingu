import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';

void main() async {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
