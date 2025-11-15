import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/word_generation_service.dart';

@RoutePage()
class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Learning')),
      body: Center(
        child: ElevatedButton(onPressed: 
        () {getIt<WordGenerationService>().test();}, child: const Text('Press me')),
        ),
    );
  }
}