class Language {
  final String bcp47Code;
  final String nativeLanguageName;


  const Language({
    required this.bcp47Code,
    required this.nativeLanguageName,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Language && other.bcp47Code == bcp47Code;
  }

  @override
  int get hashCode => bcp47Code.hashCode;
}