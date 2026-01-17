enum SupportedLanguagesBcp47 {
  en_US,
  es_MX,
}

extension SupportedLanguagesExtension on SupportedLanguagesBcp47 {
  String get completeBCP47 {
    switch (this) {
      case SupportedLanguagesBcp47.en_US:
        return "en-US";
      case SupportedLanguagesBcp47.es_MX:
        return "es-MX";
    }
  }
  String get nativeName {
    switch (this) {
      case SupportedLanguagesBcp47.en_US:
        return "English";
      case SupportedLanguagesBcp47.es_MX:
        return "Español";
    }
  }
}
