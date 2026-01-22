import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/language_specific_settings.dart';
import 'package:vitalingu/pages/home_page/home_settings_view_model.dart';

@RoutePage()
class HomeSettingsPage extends StatefulWidget {
  const HomeSettingsPage({super.key});

  @override
  State<HomeSettingsPage> createState() => _HomeSettingsPageState();
}

class _HomeSettingsPageState extends State<HomeSettingsPage> {
  final viewModel = getIt<HomeSettingsViewModel>();
  final textfieldController = TextEditingController();
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

class CEFRDropdown extends StatelessWidget {
  final CEFR selectedCEFR;
  final List<CEFR> cefrs;
  final Function(CEFR) onChanged;
  const CEFRDropdown({
    super.key,
    required this.selectedCEFR,
    required this.cefrs,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: cefrs.map((cefr) {
        return DropdownMenuItem(value: cefr, child: Text(cefr.name));
      }).toList(),
      onChanged: (CEFR? newValue) {
        if (newValue != null) {
          onChanged(newValue);
        }
      },
      value: selectedCEFR,
    );
  }
}


class LanguageDropdown extends StatelessWidget {
  final Language selectedLanguage;
  final List<Language> languages;
  final Function(Language) onChanged;
  const LanguageDropdown({
    super.key,
    required this.selectedLanguage,
    required this.languages,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: languages.map((language) {
        return DropdownMenuItem(value: language, child: Text(language.nativeName));
      }).toList(),
      onChanged: (Language? newValue) {
        if (newValue != null) {
          onChanged(newValue);
        }
      },
      value: selectedLanguage,
    );
  }
}
