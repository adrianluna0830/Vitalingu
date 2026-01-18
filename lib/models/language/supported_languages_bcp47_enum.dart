enum Language {
  English,
  Spanish,
}

extension LanguageExtensions on Language {
  
  String get local {
    switch (this) {
      case Language.English:
        return "en";
      case Language.Spanish:
        return "es";
    }
  }

  String get bcp47 {
    switch (this) {
      case Language.English:
        return "en-US";
      case Language.Spanish:
        return "es-MX";
    }
  }
  String get nativeName {
    switch (this) {
      case Language.English:
        return "English";
      case Language.Spanish:
        return "Español";
    }
  }
}
