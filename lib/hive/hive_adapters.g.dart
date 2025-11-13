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
      nativeName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Language obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.bcp47Code)
      ..writeByte(1)
      ..write(obj.nativeName);
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

class AppSettingsPersistentAdapter extends TypeAdapter<AppSettingsPersistent> {
  @override
  final typeId = 5;

  @override
  AppSettingsPersistent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettingsPersistent(
      geminiApiKey: fields[0] as String,
      pixabayApiKey: fields[1] as String,
      microsoftSpeechApiKey: fields[2] as String,
      microsoftSpeechRegion: fields[3] as String,
      nativeLanguageBcp47: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppSettingsPersistent obj) {
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
      ..write(obj.nativeLanguageBcp47);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingsPersistentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LanguageSessionSettingsPersistentAdapter
    extends TypeAdapter<LanguageSessionSettingsPersistent> {
  @override
  final typeId = 6;

  @override
  LanguageSessionSettingsPersistent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LanguageSessionSettingsPersistent(
      targetLanguageBcp47: fields[0] as String,
      imagesEnabled: fields[1] as bool,
      examplesSpeechEnabled: fields[2] as bool,
      dynamicGenerativeFrontcards: fields[3] as bool,
      numberOfExamples: (fields[4] as num).toInt(),
      maleVoiceCode: fields[5] as String,
      femaleVoiceCode: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LanguageSessionSettingsPersistent obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.targetLanguageBcp47)
      ..writeByte(1)
      ..write(obj.imagesEnabled)
      ..writeByte(2)
      ..write(obj.examplesSpeechEnabled)
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
      other is LanguageSessionSettingsPersistentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
