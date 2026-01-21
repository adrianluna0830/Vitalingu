import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/view_models/startup/startup_native_language_view_model.dart';

@RoutePage()
class StartupNativeLanguagePage extends StatefulWidget {
  const StartupNativeLanguagePage({super.key});

  @override
  State<StartupNativeLanguagePage> createState() =>
      _StartupNativeLanguagePageState();
}

class _StartupNativeLanguagePageState extends State<StartupNativeLanguagePage> {
  final viewModel = getIt<StartupNativeLanguageViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<Language>(
              value: viewModel.nativeLanguageComputed.watch(context),
              items: viewModel.supportedLanguages
                  .map(
                    (lang) => DropdownMenuItem(
                      value: lang,
                      child: Text(lang.nativeName),
                    ),
                  )
                  .toList(),
              onChanged: (newValue)  {
                 viewModel.setNativeLanguage(newValue!);
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.navigateToTargetLanguageSelectionPage(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('Next'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.navigateToLanguageIntroductionPage(),
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
