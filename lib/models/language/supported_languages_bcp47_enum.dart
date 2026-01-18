enum Languages {
  English,
  Spanish,
}

extension SupportedLanguagesExtension on Languages {
  
  String get local {
    switch (this) {
      case Languages.English:
        return "en";
      case Languages.Spanish:
        return "es";
    }
  }

  String get bcp47 {
    switch (this) {
      case Languages.English:
        return "en-US";
      case Languages.Spanish:
        return "es-MX";
    }
  }
  String get nativeName {
    switch (this) {
      case Languages.English:
        return "English";
      case Languages.Spanish:
        return "Español";
    }
  }
}
