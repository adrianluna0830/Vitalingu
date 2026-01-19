import 'package:isar_plus/isar_plus.dart';

@enumValue
enum Language {
  English("en-US"),
  Spanish("es-MX");
  
  final String bcp47;
  const Language(this.bcp47);
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

  String get nativeName {
    switch (this) {
      case Language.English:
        return "English";
      case Language.Spanish:
        return "Español";
    }
  }
}
