import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language_settings.dart';
import 'package:vitalingu/viewmodels/select_language_view_model.dart';

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

class LanguageCard extends StatelessWidget {
  final String bcp47Code;
  final String nativeName;
  final VoidCallback onTap;
  final VoidCallback onSettingsTap;

  const LanguageCard({
    super.key,
    required this.bcp47Code,
    required this.nativeName,
    required this.onTap,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(nativeName),
        subtitle: Text(bcp47Code.toUpperCase()),
        trailing: IconButton(
          icon: const Icon(Icons.edit_outlined),
          onPressed: onSettingsTap,
        ),
        onTap: onTap,
      ),
    );
  }
}

class LanguageSettingsSheet extends StatefulWidget {
  final String languageName;
  final LanguageSettings languageSettings;
  final Function(LanguageSettings) onSave;

  const LanguageSettingsSheet({
    super.key,
    required this.languageName,
    required this.languageSettings,
    required this.onSave,
  });

  static void show(
    BuildContext context,
    String languageName, {
    required LanguageSettings languageSettings,
    required Function(LanguageSettings) onSave,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => LanguageSettingsSheet(
        languageName: languageName,
        languageSettings: languageSettings,
        onSave: onSave,
      ),
    );
  }

  @override
  State<LanguageSettingsSheet> createState() => _LanguageSettingsSheetState();
}

class _LanguageSettingsSheetState extends State<LanguageSettingsSheet> {
  late bool imagesEnabled;
  late bool examplesUntranslatedSpeechEnabled;
  late bool examplesTranslatedSpeechEnabled;
  late bool dynamicGenerativeFrontcards;
  late int numberOfExamples;
  late String maleVoiceCode;
  late String femaleVoiceCode;

  final List<String> maleVoiceOptions = [
    'en-US-Male-1',
    'en-US-Male-2',
    'es-ES-Male-1',
    'es-MX-Male-1',
  ];

  final List<String> femaleVoiceOptions = [
    'en-US-Female-1',
    'en-US-Female-2',
    'es-ES-Female-1',
    'es-MX-Female-1',
  ];

  @override
  void initState() {
    super.initState();
    imagesEnabled = widget.languageSettings.imagesEnabled;
    examplesUntranslatedSpeechEnabled = widget.languageSettings.examplesUntranslatedSpeechEnabled;
    examplesTranslatedSpeechEnabled = widget.languageSettings.examplesTranslatedSpeechEnabled;
    dynamicGenerativeFrontcards = widget.languageSettings.dynamicGenerativeFrontcards;
    numberOfExamples = widget.languageSettings.numberOfExamples.clamp(1, 10);

    maleVoiceCode = maleVoiceOptions.contains(widget.languageSettings.maleVoiceCode)
        ? widget.languageSettings.maleVoiceCode
        : maleVoiceOptions.first;

    femaleVoiceCode = femaleVoiceOptions.contains(widget.languageSettings.femaleVoiceCode)
        ? widget.languageSettings.femaleVoiceCode
        : femaleVoiceOptions.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text('Settings for ${widget.languageName}'),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            SwitchListTile(
              title: const Text('Images Enabled'),
              subtitle: const Text('Show images on cards'),
              value: imagesEnabled,
              onChanged: (value) => setState(() => imagesEnabled = value),
            ),
            SwitchListTile(
              title: const Text('Audio for Untranslated Examples'),
              subtitle: const Text('Play audio for examples in the original language'),
              value: examplesUntranslatedSpeechEnabled,
              onChanged: (value) => setState(() => examplesUntranslatedSpeechEnabled = value),
            ),
            SwitchListTile(
              title: const Text('Audio for Translated Examples'),
              subtitle: const Text('Play audio for translated examples'),
              value: examplesTranslatedSpeechEnabled,
              onChanged: (value) => setState(() => examplesTranslatedSpeechEnabled = value),
            ),
            SwitchListTile(
              title: const Text('Dynamic Cards'),
              subtitle: const Text('Generate dynamic content'),
              value: dynamicGenerativeFrontcards,
              onChanged: (value) => setState(() => dynamicGenerativeFrontcards = value),
            ),
            ListTile(
              title: const Text('Number of Examples'),
              subtitle: Slider(
                value: numberOfExamples.toDouble(),
                min: 1,
                max: 10,
                divisions: 9,
                label: numberOfExamples.toString(),
                onChanged: (value) => setState(() => numberOfExamples = value.toInt()),
              ),
            ),
            ListTile(
              title: const Text('Male Voice'),
              subtitle: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(text: maleVoiceCode),
                      decoration: const InputDecoration(
                        labelText: 'Enter male voice code',
                      ),
                      onChanged: (value) {
                        setState(() => maleVoiceCode = value);
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Female Voice'),
              subtitle: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(text: femaleVoiceCode),
                      decoration: const InputDecoration(
                        labelText: 'Enter female voice code',
                      ),
                      onChanged: (value) {
                        setState(() => femaleVoiceCode = value);
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final settings = LanguageSettings(
                  imagesEnabled: imagesEnabled,
                  examplesUntranslatedSpeechEnabled: examplesUntranslatedSpeechEnabled,
                  examplesTranslatedSpeechEnabled: examplesTranslatedSpeechEnabled,
                  dynamicGenerativeFrontcards: dynamicGenerativeFrontcards,
                  numberOfExamples: numberOfExamples,
                  maleVoiceCode: maleVoiceCode,
                  femaleVoiceCode: femaleVoiceCode,
                );
                widget.onSave(settings);
                Navigator.pop(context);
              },
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }
}