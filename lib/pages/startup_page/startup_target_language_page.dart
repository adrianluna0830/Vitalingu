import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/view_models/startup/startup_target_language_view_model.dart';

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
    final currentState = viewModel.state.watch(context);
    

    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<SupportedLanguagesBcp47>(
              value: currentState.targetLanguage,
              hint: Text('Select target language'),
              items: currentState.supportedLanguages
                  .map(
                    (lang) => DropdownMenuItem(
                      value: lang,
                      child: Text(lang.nativeName),
                    ),
                  )
                  .toList(),
              onChanged: (newValue) async {
                await viewModel.confirmLanguages(newValue!);
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: currentState.canContinue
                  ? () => viewModel.navigateNext(context.tabsRouter)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: currentState.canContinue
                    ? Colors.blue
                    : Colors.grey,
                foregroundColor: Colors.white,
              ),
              child: Text('Next'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.navigatePrevious(context.tabsRouter),
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
