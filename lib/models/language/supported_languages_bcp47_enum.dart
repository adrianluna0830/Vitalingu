enum SupportedLanguagesBcp47 {
  en,
  es,
}

extension SupportedLanguagesExtension on SupportedLanguagesBcp47 {
  String get nativeName {
    switch (this) {
      case SupportedLanguagesBcp47.en:
        return "English";
      case SupportedLanguagesBcp47.es:
        return "Español";
    }
  }
}
