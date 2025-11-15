import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Learning')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 400,
          height: 300,
          color: Colors.red, // El color es solo para demostrar el contenedor
          ),
        ),
    );
  }
}