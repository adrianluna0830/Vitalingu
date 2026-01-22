import 'package:injectable/injectable.dart';
import 'package:sembast/utils/database_utils.dart';
import 'package:signals/signals.dart';
import 'package:vitalingu/models/shared_preferences_store.dart';
import 'package:vitalingu/models/user_app_settings.dart';

@injectable
class SpeakingSkillSignal extends PersistedSignal<double> {
  final Database db;
  final TargetLanguageSignal targetLanguage;
  SpeakingSkillSignal({required this.db, required this.targetLanguage})
    : super(
        0,
        key: 'speakingSkill',
        store: SembastLanguageSpecificStore(
          db: db,
          targetLanguage: targetLanguage.value,
        ),
      );

  @FactoryMethod()
  static Future<SpeakingSkillSignal> create({
    required Database db,
    required TargetLanguageSignal targetLanguage,
  }) async {
    final signal = SpeakingSkillSignal(db: db, targetLanguage: targetLanguage);
    await signal.init();
    return signal;
  }
}

@injectable
class HearingSkillSignal extends PersistedSignal<double> {
  final Database db;
  final TargetLanguageSignal targetLanguage;
  HearingSkillSignal({required this.db, required this.targetLanguage})
    : super(
        0,
        key: 'hearingSkill',
        store: SembastLanguageSpecificStore(
          db: db,
          targetLanguage: targetLanguage.value,
        ),
      );

  @FactoryMethod()
  static Future<HearingSkillSignal> create({
    required Database db,
    required TargetLanguageSignal targetLanguage,
  }) async {
    final signal = HearingSkillSignal(db: db, targetLanguage: targetLanguage);
    await signal.init();
    return signal;
  }
}

@injectable
class ListeningSkillSignal extends PersistedSignal<double> {
  final Database db;
  final TargetLanguageSignal targetLanguage;
  ListeningSkillSignal({required this.db, required this.targetLanguage})
    : super(
        0,
        key: 'listeningSkill',
        store: SembastLanguageSpecificStore(
          db: db,
          targetLanguage: targetLanguage.value,
        ),
      );

  @FactoryMethod()
  static Future<ListeningSkillSignal> create({
    required Database db,
    required TargetLanguageSignal targetLanguage,
  }) async {
    final signal = ListeningSkillSignal(db: db, targetLanguage: targetLanguage);
    await signal.init();
    return signal;
  }
}

@injectable
class WritingSkillSignal extends PersistedSignal<double> {
  final Database db;
  final TargetLanguageSignal targetLanguage;
  WritingSkillSignal({required this.db, required this.targetLanguage})
    : super(
        0,
        key: 'writingSkill',
        store: SembastLanguageSpecificStore(
          db: db,
          targetLanguage: targetLanguage.value,
        ),
      );

  @FactoryMethod()
  static Future<WritingSkillSignal> create({
    required Database db,
    required TargetLanguageSignal targetLanguage,
  }) async {
    final signal = WritingSkillSignal(db: db, targetLanguage: targetLanguage);
    await signal.init();
    return signal;
  }
}

@injectable
class HasStartedLanguage extends PersistedSignal<bool> {
  final Database db;
  final TargetLanguageSignal targetLanguage;
  HasStartedLanguage({required this.db, required this.targetLanguage})
    : super(
        false,
        key: 'hasStartedLanguage',
        store: SembastLanguageSpecificStore(
          db: db,
          targetLanguage: targetLanguage.value,
        ),
      );

  @FactoryMethod()
  static Future<HasStartedLanguage> create({
    required Database db,
    required TargetLanguageSignal targetLanguage,
  }) async {
    final signal = HasStartedLanguage(db: db, targetLanguage: targetLanguage);
    await signal.init();
    return signal;
  }
}
