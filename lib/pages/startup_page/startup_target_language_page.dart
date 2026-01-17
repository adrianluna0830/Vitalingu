import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/view_models/startup/startup_target_language_view_model.dart';

@RoutePage()
class StartupTargetLanguagePage extends StatefulWidget {
  final SupportedLanguagesBcp47? initialLanguage;
  const StartupTargetLanguagePage({super.key, this.initialLanguage});

  @override
  State<StartupTargetLanguagePage> createState() =>
      _StartupTargetLanguagePageState();
}

class _StartupTargetLanguagePageState extends State<StartupTargetLanguagePage> {
  final viewModel = getIt<StartupTargetLanguageViewModel>();

  @override
  Widget build(BuildContext context) {
    final currentState = viewModel.state.watch(context);
    
    final availableLanguages = viewModel.getSupportedLanguagesExcludingNative(widget.initialLanguage!);
    final currentValue = availableLanguages.contains(viewModel.targetLanguage) 
        ? viewModel.targetLanguage 
        : null;
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<SupportedLanguagesBcp47>(
              value: currentValue,
              hint: Text('Select target language'),
              items: availableLanguages
                  .map(
                    (lang) => DropdownMenuItem(
                      value: lang,
                      child: Text(lang.nativeName),
                    ),
                  )
                  .toList(),
              onChanged: (newValue) async {
                await viewModel.confirmLanguages(newValue!, widget.initialLanguage!);
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
