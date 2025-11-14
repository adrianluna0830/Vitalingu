import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/viewmodels/select_language_view_models.dart';

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
        title: const Text('Seleccionar Idioma'),
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
            onSettingsTap: () {
              LanguageSettingsSheet.show(
                context,
                language.nativeLanguageName,
                onSave: (settings) {
                  print('Settings saved: $settings');
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

class LanguageSessionSettingsPersistent {
  final bool imagesEnabled;
  final bool examplesUntranslatedSpeechEnabled;
  final bool examplesTranslatedSpeechEnabled;
  final bool dynamicGenerativeFrontcards;
  final int numberOfExamples;
  final String maleVoiceCode;
  final String femaleVoiceCode;

  const LanguageSessionSettingsPersistent({
    required this.examplesTranslatedSpeechEnabled,
    required this.imagesEnabled,
    required this.examplesUntranslatedSpeechEnabled,
    required this.dynamicGenerativeFrontcards,
    required this.numberOfExamples,
    required this.maleVoiceCode,
    required this.femaleVoiceCode,
  });

  @override
  String toString() {
    return 'LanguageSessionSettings(images: $imagesEnabled, '
        'examplesUntranslatedSpeech: $examplesUntranslatedSpeechEnabled, '
        'examplesTranslatedSpeech: $examplesTranslatedSpeechEnabled, '
        'dynamicFrontcards: $dynamicGenerativeFrontcards, examples: $numberOfExamples, '
        'maleVoice: $maleVoiceCode, femaleVoice: $femaleVoiceCode)';
  }
}

class LanguageSettingsSheet extends StatefulWidget {
  final String languageName;
  final Function(LanguageSessionSettingsPersistent) onSave;

  const LanguageSettingsSheet({
    super.key,
    required this.languageName,
    required this.onSave,
  });

  static void show(
    BuildContext context,
    String languageName, {
    required Function(LanguageSessionSettingsPersistent) onSave,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => LanguageSettingsSheet(
        languageName: languageName,
        onSave: onSave,
      ),
    );
  }

  @override
  State<LanguageSettingsSheet> createState() => _LanguageSettingsSheetState();
}

class _LanguageSettingsSheetState extends State<LanguageSettingsSheet> {
  bool imagesEnabled = true;
  bool examplesUntranslatedSpeechEnabled = true;
  bool examplesTranslatedSpeechEnabled = true;
  bool dynamicGenerativeFrontcards = false;
  int numberOfExamples = 3;
  String maleVoiceCode = 'en-US-Male-1';
  String femaleVoiceCode = 'en-US-Female-1';

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
                Text('Ajustes de ${widget.languageName}'),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            SwitchListTile(
              title: const Text('Imágenes habilitadas'),
              subtitle: const Text('Mostrar imágenes en las tarjetas'),
              value: imagesEnabled,
              onChanged: (value) => setState(() => imagesEnabled = value),
            ),
            SwitchListTile(
              title: const Text('Audio en ejemplos sin traducir'),
              subtitle: const Text('Reproducir audio de ejemplos en idioma original'),
              value: examplesUntranslatedSpeechEnabled,
              onChanged: (value) => setState(() => examplesUntranslatedSpeechEnabled = value),
            ),
            SwitchListTile(
              title: const Text('Audio en ejemplos traducidos'),
              subtitle: const Text('Reproducir audio de ejemplos traducidos'),
              value: examplesTranslatedSpeechEnabled,
              onChanged: (value) => setState(() => examplesTranslatedSpeechEnabled = value),
            ),
            SwitchListTile(
              title: const Text('Tarjetas dinámicas'),
              subtitle: const Text('Generar contenido dinámico'),
              value: dynamicGenerativeFrontcards,
              onChanged: (value) => setState(() => dynamicGenerativeFrontcards = value),
            ),
            ListTile(
              title: const Text('Número de ejemplos'),
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
              title: const Text('Voz masculina'),
              subtitle: Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: maleVoiceCode,
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(value: 'en-US-Male-1', child: Text('en-US-Male-1')),
                        DropdownMenuItem(value: 'en-US-Male-2', child: Text('en-US-Male-2')),
                        DropdownMenuItem(value: 'es-ES-Male-1', child: Text('es-ES-Male-1')),
                        DropdownMenuItem(value: 'es-MX-Male-1', child: Text('es-MX-Male-1')),
                      ],
                      onChanged: (value) {
                        if (value != null) setState(() => maleVoiceCode = value);
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () {
                      // TODO: Reproducir audio de preview
                      print('Preview male voice: $maleVoiceCode');
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Voz femenina'),
              subtitle: Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: femaleVoiceCode,
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(value: 'en-US-Female-1', child: Text('en-US-Female-1')),
                        DropdownMenuItem(value: 'en-US-Female-2', child: Text('en-US-Female-2')),
                        DropdownMenuItem(value: 'es-ES-Female-1', child: Text('es-ES-Female-1')),
                        DropdownMenuItem(value: 'es-MX-Female-1', child: Text('es-MX-Female-1')),
                      ],
                      onChanged: (value) {
                        if (value != null) setState(() => femaleVoiceCode = value);
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () {
                      // TODO: Reproducir audio de preview
                      print('Preview female voice: $femaleVoiceCode');
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final settings = LanguageSessionSettingsPersistent(
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
              child: const Text('Guardar configuración'),
            ),
          ],
        ),
      ),
    );
  }
}