import 'package:isar_plus/isar_plus.dart';

@enumValue
enum Language {
  English("en"),
  Spanish("es");
  
  final String locale;
  const Language(this.locale);
}

extension LanguageExtensions on Language {
  
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
