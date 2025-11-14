// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class LanguageAdapter extends TypeAdapter<Language> {
  @override
  final typeId = 2;

  @override
  Language read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Language(
      bcp47Code: fields[0] as String,
      nativeLanguageName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Language obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.bcp47Code)
      ..writeByte(3)
      ..write(obj.nativeLanguageName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LanguageSessionSettingsAdapter
    extends TypeAdapter<LanguageSessionSettings> {
  @override
  final typeId = 7;

  @override
  LanguageSessionSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LanguageSessionSettings(
      examplesTranslatedSpeechEnabled: fields[2] as bool,
      imagesEnabled: fields[0] as bool,
      examplesUntranslatedSpeechEnabled: fields[1] as bool,
      dynamicGenerativeFrontcards: fields[3] as bool,
      numberOfExamples: (fields[4] as num).toInt(),
      maleVoiceCode: fields[5] as String,
      femaleVoiceCode: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LanguageSessionSettings obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.imagesEnabled)
      ..writeByte(1)
      ..write(obj.examplesUntranslatedSpeechEnabled)
      ..writeByte(2)
      ..write(obj.examplesTranslatedSpeechEnabled)
      ..writeByte(3)
      ..write(obj.dynamicGenerativeFrontcards)
      ..writeByte(4)
      ..write(obj.numberOfExamples)
      ..writeByte(5)
      ..write(obj.maleVoiceCode)
      ..writeByte(6)
      ..write(obj.femaleVoiceCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageSessionSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppSettingsAdapter extends TypeAdapter<AppSettings> {
  @override
  final typeId = 8;

  @override
  AppSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettings(
      geminiApiKey: fields[0] as String,
      pixabayApiKey: fields[1] as String,
      microsoftSpeechApiKey: fields[2] as String,
      microsoftSpeechRegion: fields[3] as String,
      nativeLanguage: fields[4] as Language,
    );
  }

  @override
  void write(BinaryWriter writer, AppSettings obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.geminiApiKey)
      ..writeByte(1)
      ..write(obj.pixabayApiKey)
      ..writeByte(2)
      ..write(obj.microsoftSpeechApiKey)
      ..writeByte(3)
      ..write(obj.microsoftSpeechRegion)
      ..writeByte(4)
      ..write(obj.nativeLanguage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
