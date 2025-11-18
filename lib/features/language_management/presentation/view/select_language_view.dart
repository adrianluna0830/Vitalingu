import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/features/language_management/presentation/view_model/select_language_view_model.dart';
import 'package:vitalingu/shared/widgets/select_language/language_card.dart';
import 'package:vitalingu/shared/widgets/select_language/language_settings_sheet.dart';

@RoutePage()
class SelectLanguageView extends StatefulWidget {
  const SelectLanguageView({super.key});

  @override
  State<SelectLanguageView> createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
  late final SelectLanguageViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<SelectLanguageViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
        actions: [
          IconButton(
            onPressed: viewModel.goToSettings,
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: viewModel.availableLanguages.length,
        itemBuilder: (context, index) {
          final language = viewModel.availableLanguages[index];
          return LanguageCard(
            bcp47Code: language.bcp47Code,
            nativeName: language.nativeLanguageName,
            onTap: () => viewModel.selectLanguage(language),
            onSettingsTap: () async {
              final languageSettings = await viewModel.getLanguageSettings(language.bcp47Code);
              LanguageSettingsSheet.show(
                context,
                language.nativeLanguageName,
                languageSettings: languageSettings,
                onSave: (settings) async {
                  await viewModel.saveLanguageSettings(settings, language.bcp47Code);
                },
              );
            },
          );
        },
      ),
    );
  }
}

