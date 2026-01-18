// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class CEFRAdapter extends TypeAdapter<CEFR> {
  @override
  final typeId = 1;

  @override
  CEFR read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CEFR.A1;
      case 1:
        return CEFR.A2;
      case 2:
        return CEFR.B1;
      case 3:
        return CEFR.B2;
      case 4:
        return CEFR.C1;
      case 5:
        return CEFR.C2;
      default:
        return CEFR.A1;
    }
  }

  @override
  void write(BinaryWriter writer, CEFR obj) {
    switch (obj) {
      case CEFR.A1:
        writer.writeByte(0);
      case CEFR.A2:
        writer.writeByte(1);
      case CEFR.B1:
        writer.writeByte(2);
      case CEFR.B2:
        writer.writeByte(3);
      case CEFR.C1:
        writer.writeByte(4);
      case CEFR.C2:
        writer.writeByte(5);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CEFRAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GrammarTopicAdapter extends TypeAdapter<GrammarTopic> {
  @override
  final typeId = 2;

  @override
  GrammarTopic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GrammarTopic(
      topicDescriptionId: fields[0] as String,
      cefrLevel: fields[2] as CEFR,
      bcp47: fields[8] as Languages,
      topicLearningOrder: (fields[9] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, GrammarTopic obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.topicDescriptionId)
      ..writeByte(2)
      ..write(obj.cefrLevel)
      ..writeByte(8)
      ..write(obj.bcp47)
      ..writeByte(9)
      ..write(obj.topicLearningOrder);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrammarTopicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserLanguageSkillsDataAdapter
    extends TypeAdapter<UserLanguageSkillsData> {
  @override
  final typeId = 3;

  @override
  UserLanguageSkillsData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLanguageSkillsData(language: fields[0] as Languages)
      ..normalizedListeningProgress = (fields[1] as num).toDouble()
      ..normalizedSpeakingProgress = (fields[2] as num).toDouble()
      ..normalizedReadingProgress = (fields[3] as num).toDouble()
      ..normalizedWritingProgress = (fields[4] as num).toDouble();
  }

  @override
  void write(BinaryWriter writer, UserLanguageSkillsData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.language)
      ..writeByte(1)
      ..write(obj.normalizedListeningProgress)
      ..writeByte(2)
      ..write(obj.normalizedSpeakingProgress)
      ..writeByte(3)
      ..write(obj.normalizedReadingProgress)
      ..writeByte(4)
      ..write(obj.normalizedWritingProgress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLanguageSkillsDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GrammarTopicUserDataAdapter extends TypeAdapter<GrammarTopicUserData> {
  @override
  final typeId = 4;

  @override
  GrammarTopicUserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GrammarTopicUserData(
        topicId: fields[2] as String,
        languageBcp47: fields[3] as Languages,
      )
      ..globalMastery = (fields[9] as num).toDouble()
      ..currentLocalMasteryHistory = (fields[11] as List).cast<double>();
  }

  @override
  void write(BinaryWriter writer, GrammarTopicUserData obj) {
    writer
      ..writeByte(4)
      ..writeByte(2)
      ..write(obj.topicId)
      ..writeByte(3)
      ..write(obj.languageBcp47)
      ..writeByte(9)
      ..write(obj.globalMastery)
      ..writeByte(11)
      ..write(obj.currentLocalMasteryHistory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrammarTopicUserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LanguagesAdapter extends TypeAdapter<Languages> {
  @override
  final typeId = 5;

  @override
  Languages read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 2:
        return Languages.English;
      case 3:
        return Languages.Spanish;
      default:
        return Languages.English;
    }
  }

  @override
  void write(BinaryWriter writer, Languages obj) {
    switch (obj) {
      case Languages.English:
        writer.writeByte(2);
      case Languages.Spanish:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
