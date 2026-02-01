import 'package:flutter/material.dart';
import 'package:vitalingu/core/models/language/language_enum.dart';

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
