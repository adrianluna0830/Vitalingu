// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class AppSettingsPersistentAdapter extends TypeAdapter<AppSettingsPersistent> {
  @override
  final typeId = 3;

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
