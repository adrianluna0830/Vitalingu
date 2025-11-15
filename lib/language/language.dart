class Language {
  final String bcp47Code;
  final String nativeLanguageName;

  const Language({
    required this.bcp47Code,
    required this.nativeLanguageName,
  });

  Map<String, dynamic> toJson() {
    return {
      'bcp47Code': bcp47Code,
      'nativeLanguageName': nativeLanguageName,
    };
  }

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      bcp47Code: json['bcp47Code'] as String,
      nativeLanguageName: json['nativeLanguageName'] as String,
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