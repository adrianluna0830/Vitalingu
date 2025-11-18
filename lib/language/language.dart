class Language {
  final String bcp47Code;
  final String nativeLanguageName;
  final List<String> voices;

  const Language({
    required this.bcp47Code,
    required this.nativeLanguageName,
    required this.voices,
  });

  Map<String, dynamic> toJson() {
    return {
      'bcp47Code': bcp47Code,
      'nativeLanguageName': nativeLanguageName,
      'voices': voices,
    };
  }

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      bcp47Code: json['bcp47Code'] as String,
      nativeLanguageName: json['nativeLanguageName'] as String,
      voices: List<String>.from(json['voices'] as List),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Language && other.bcp47Code == bcp47Code;
  }

  @override
  int get hashCode => bcp47Code.hashCode;
}