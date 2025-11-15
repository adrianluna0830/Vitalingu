import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/app_settings.dart';
import 'package:vitalingu/models/language_session_settings.dart';
import 'package:vitalingu/models/language_settings.dart';
import 'package:vitalingu/services/prompt_service.dart';
import 'package:vitalingu/viewmodels/language_view_model.dart';
import 'package:vitalingu/widgets/target_language_selectable_text.dart';

@RoutePage()
class LanguageView extends StatefulWidget {

   const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
   final LanguageViewModel viewModel = getIt<LanguageViewModel>();
   String text = "This is a sample context for translation.";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TargetLanguageSelectableText(
              fullText: text ,
              onTranslate: (String expandedSelection, String textContext) {getIt<PromptService>().getTranslation(textContext, "Ge"); },
              onExplainDoubt: (String expandedSelection, String textContext) {},
              onWordInfo: (String expandedSelection, String textContext) { },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              print(getIt<LanguageSessionScopeSettings>().languageSettings.toString() );
            },
            child: const Text("Press me"),
          ),
        ],
      ),
    );
  }
}
