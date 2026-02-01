import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/models/language/language_enum.dart';
import 'package:vitalingu/features/home/view_models/home_settings_view_model.dart';
import 'package:vitalingu/core/widgets/text_field_and_validator.dart';
import 'package:vitalingu/features/home/widgets/translate_option.dart';
import 'package:vitalingu/language_dropdown.dart';

@RoutePage()
class HomeSettingsPage extends StatefulWidget {
  const HomeSettingsPage({super.key});

  @override
  State<HomeSettingsPage> createState() => _HomeSettingsPageState();
}

class _HomeSettingsPageState extends State<HomeSettingsPage> {
  final viewModel = getIt<HomeSettingsViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildLanguageRow(
            label: 'Native Language',
            selectedLanguage: viewModel.nativeLanguageSignal.watch(context),
            onChanged: (language) {
              viewModel.updateNativeLanguage(language);
            },
          ),
          _buildLanguageRow(
            label: 'Target Language',
            selectedLanguage: viewModel.targetLanguageSignal.watch(context),
            onChanged: (language) {

              viewModel.updateTargetLanguage(language);
            },
          ),
          TextFieldAndValidator(onChanged: (value) {
            viewModel.updateGeminiApiKey(value);
          }, initialValue: viewModel.geminiApiKeySignal.watch(context),errorMessage: null,),
          TranslateOption(value: viewModel.alwaysTranslateSignal.watch(context), onChanged: viewModel.updateAlwaysTranslate),
        
        ],
      ),
    );
  }

  Widget _buildLanguageRow({
    required String label,
    required Language selectedLanguage,
    required Function(Language) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            const SizedBox(width: 10),
            LanguageDropdown(
              selectedLanguage: selectedLanguage,
              languages: Language.values,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
