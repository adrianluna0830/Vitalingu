import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/features/language_management/data/model/language_settings.dart';
import 'package:vitalingu/features/language_management/presentation/view_model/select_language_view_model.dart';
import 'package:vitalingu/shared/widgets/select_language/number_of_examples_slider.dart';
import 'package:vitalingu/shared/widgets/select_language/save_settings_button.dart';
import 'package:vitalingu/shared/widgets/select_language/settings_sheet_header.dart';
import 'package:vitalingu/shared/widgets/select_language/settings_switch_tile.dart';
import 'package:vitalingu/shared/widgets/voice_selector.dart';

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
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: LanguageSettingsSheet(
          languageName: languageName,
          languageSettings: languageSettings,
          onSave: onSave,
        ),
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
  late String? maleVoiceCode;
  late String? femaleVoiceCode;

  late List<String> availableVoices;

  @override
  void initState() {
    super.initState();
    imagesEnabled = widget.languageSettings.imagesEnabled;
    examplesUntranslatedSpeechEnabled = widget.languageSettings.examplesUntranslatedSpeechEnabled;
    examplesTranslatedSpeechEnabled = widget.languageSettings.examplesTranslatedSpeechEnabled;
    dynamicGenerativeFrontcards = widget.languageSettings.dynamicGenerativeFrontcards;
    numberOfExamples = widget.languageSettings.numberOfExamples.clamp(1, 10);

    final viewModel = getIt<SelectLanguageViewModel>();
    final language = viewModel.availableLanguages.firstWhere(
      (lang) => lang.nativeLanguageName == widget.languageName,
    );
    availableVoices = language.voices;

    if (widget.languageSettings.maleVoiceCode != null &&
        availableVoices.contains(widget.languageSettings.maleVoiceCode)) {
      maleVoiceCode = widget.languageSettings.maleVoiceCode;
    } else if (availableVoices.isNotEmpty) {
      maleVoiceCode = availableVoices.first;
    } else {
      maleVoiceCode = null;
    }

    if (widget.languageSettings.femaleVoiceCode != null &&
        availableVoices.contains(widget.languageSettings.femaleVoiceCode)) {
      femaleVoiceCode = widget.languageSettings.femaleVoiceCode;
    } else if (availableVoices.isNotEmpty) {
      femaleVoiceCode = availableVoices.first;
    } else {
      femaleVoiceCode = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<SelectLanguageViewModel>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingsSheetHeader(
            languageName: widget.languageName,
            onClose: () => Navigator.pop(context),
          ),
          SettingsSwitchTile(
            title: 'Images Enabled',
            subtitle: 'Show images on cards',
            value: imagesEnabled,
            onChanged: (value) => setState(() => imagesEnabled = value),
          ),
          SettingsSwitchTile(
            title: 'Audio for Untranslated Examples',
            subtitle: 'Play audio for examples in the original language',
            value: examplesUntranslatedSpeechEnabled,
            onChanged: (value) => setState(() => examplesUntranslatedSpeechEnabled = value),
          ),
          SettingsSwitchTile(
            title: 'Audio for Translated Examples',
            subtitle: 'Play audio for translated examples',
            value: examplesTranslatedSpeechEnabled,
            onChanged: (value) => setState(() => examplesTranslatedSpeechEnabled = value),
          ),
          SettingsSwitchTile(
            title: 'Dynamic Cards',
            subtitle: 'Generate dynamic content',
            value: dynamicGenerativeFrontcards,
            onChanged: (value) => setState(() => dynamicGenerativeFrontcards = value),
          ),
          NumberOfExamplesSlider(
            value: numberOfExamples,
            onChanged: (value) => setState(() => numberOfExamples = value),
          ),
          if (availableVoices.isNotEmpty)
            VoiceSelector(
              title: 'Male Voice',
              voiceCode: maleVoiceCode,
              availableVoices: availableVoices,
              onVoiceChanged: (value) => setState(() => maleVoiceCode = value),
              onPlayVoice: () => viewModel.playVoice(maleVoiceCode!),
            ),
          if (availableVoices.isNotEmpty)
            VoiceSelector(
              title: 'Female Voice',
              voiceCode: femaleVoiceCode,
              availableVoices: availableVoices,
              onVoiceChanged: (value) => setState(() => femaleVoiceCode = value),
              onPlayVoice: () => viewModel.playVoice(femaleVoiceCode!),
            ),
          SaveSettingsButton(
            onPressed: () {
              if (maleVoiceCode == null && femaleVoiceCode == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select at least one voice'),
                  ),
                );
                return;
              }

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
          ),
        ],
      ),
    );
  }
}

