import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/models/language/language_enum.dart';
import 'package:vitalingu/features/startup/view_models/startup_target_language_view_model.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class StartupTargetLanguagePage extends StatefulWidget {
  const StartupTargetLanguagePage({super.key});

  @override
  State<StartupTargetLanguagePage> createState() =>
      _StartupTargetLanguagePageState();
}

class _StartupTargetLanguagePageState extends State<StartupTargetLanguagePage> {
  final viewModel = getIt<StartupTargetLanguageViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<Language>(
              value: viewModel.targetLanguageSignal.watch(context),
              hint: Text('Select target language'),
              items: viewModel.supportedLanguages.watch(context)
                  .map(
                    (lang) => DropdownMenuItem(
                      value: lang,
                      child: Text(lang.nativeName),
                    ),
                  )
                  .toList(),
              onChanged: (newValue) {
                viewModel.selectTargetLanguage(newValue!);
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.goToLevelSelectionPage(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('Next'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.goToNativeLanguageSelectionPage(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, 
                foregroundColor: Colors.white,
              ),
              child: Text('Previous'),
            )
          ],
        ),
      ),
    );
  }
}
