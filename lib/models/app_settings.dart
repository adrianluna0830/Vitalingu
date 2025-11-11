class AppSettings {
  final String geminiApiKey;
  final String pixabayApiKey;

  AppSettings({
    required this.geminiApiKey,
    required this.pixabayApiKey,
  });

  factory AppSettings.empty() {
    return AppSettings(
      geminiApiKey: '',
      pixabayApiKey: '',
    );
  }

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    return AppSettings(
      geminiApiKey: json['geminiApiKey'] ?? '',
      pixabayApiKey: json['pixabayApiKey'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'geminiApiKey': geminiApiKey,
      'pixabayApiKey': pixabayApiKey,
    };
  }

  AppSettings copyWith({
    String? geminiApiKey,
    String? pixabayApiKey,
  }) {
    return AppSettings(
      geminiApiKey: geminiApiKey ?? this.geminiApiKey,
      pixabayApiKey: pixabayApiKey ?? this.pixabayApiKey,
    );
  }
}
