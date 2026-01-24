import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/language/topic_translation.dart';

final List<GrammarTopic> spanishGrammarTopics = [
  GrammarTopic(
    topicTitle: 'Present Indicative (ser and estar)',
    topicCode: 'present_indicative_ser_estar',
    topicLearningOrder: 1,
    cefrLevel: CEFR.A1,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Present Indicative (regular verbs)',
    topicCode: 'present_indicative_regular_verbs',
    topicLearningOrder: 2,
    cefrLevel: CEFR.A1,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Gender and Number of Nouns',
    topicCode: 'gender_and_number_of_nouns',
    topicLearningOrder: 3,
    cefrLevel: CEFR.A1,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Definite and Indefinite Articles',
    topicCode: 'definite_and_indefinite_articles',
    topicLearningOrder: 4,
    cefrLevel: CEFR.A1,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Preterite (regular verbs)',
    topicCode: 'preterite_regular_verbs',
    topicLearningOrder: 5,
    cefrLevel: CEFR.A2,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Preterite (irregular verbs)',
    topicCode: 'preterite_irregular_verbs',
    topicLearningOrder: 6,
    cefrLevel: CEFR.A2,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Imperfect Tense',
    topicCode: 'imperfect_tense',
    topicLearningOrder: 7,
    cefrLevel: CEFR.A2,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Present Progressive',
    topicCode: 'present_progressive',
    topicLearningOrder: 8,
    cefrLevel: CEFR.A2,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Near Future (ir a + infinitive)',
    topicCode: 'near_future_ir_a_infinitive',
    topicLearningOrder: 9,
    cefrLevel: CEFR.A2,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Present Perfect',
    topicCode: 'present_perfect',
    topicLearningOrder: 10,
    cefrLevel: CEFR.B1,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Direct and Indirect Object Pronouns',
    topicCode: 'direct_and_indirect_object_pronouns',
    topicLearningOrder: 11,
    cefrLevel: CEFR.B1,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Comparatives and Superlatives',
    topicCode: 'comparatives_and_superlatives',
    topicLearningOrder: 12,
    cefrLevel: CEFR.B1,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Subjunctive Mood (present)',
    topicCode: 'subjunctive_mood_present',
    topicLearningOrder: 13,
    cefrLevel: CEFR.B1,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Prepositions of Time and Place',
    topicCode: 'prepositions_of_time_and_place',
    topicLearningOrder: 14,
    cefrLevel: CEFR.B1,
    language: Language.Spanish,
  ),
  GrammarTopic(
    topicTitle: 'Passive Voice',
    topicCode: 'passive_voice',
    topicLearningOrder: 15,
    cefrLevel: CEFR.B2,
    language: Language.Spanish,
  ),
];

final List<TopicTranslation> spanishTopicTranslations = [
  // present_indicative_ser_estar
  TopicTranslation(
      topicCode: 'present_indicative_ser_estar',
      translationLanguage: Language.English,
      translation: 'Present Indicative (ser and estar)'),
  TopicTranslation(
      topicCode: 'present_indicative_ser_estar',
      translationLanguage: Language.Spanish,
      translation: 'Presente Indicativo (ser y estar)'),

  // present_indicative_regular_verbs
  TopicTranslation(
      topicCode: 'present_indicative_regular_verbs',
      translationLanguage: Language.English,
      translation: 'Present Indicative (regular verbs)'),
  TopicTranslation(
      topicCode: 'present_indicative_regular_verbs',
      translationLanguage: Language.Spanish,
      translation: 'Presente Indicativo (verbos regulares)'),

  // gender_and_number_of_nouns
  TopicTranslation(
      topicCode: 'gender_and_number_of_nouns',
      translationLanguage: Language.English,
      translation: 'Gender and Number of Nouns'),
  TopicTranslation(
      topicCode: 'gender_and_number_of_nouns',
      translationLanguage: Language.Spanish,
      translation: 'Género y Número de Sustantivos'),

  // definite_and_indefinite_articles
  TopicTranslation(
      topicCode: 'definite_and_indefinite_articles',
      translationLanguage: Language.English,
      translation: 'Definite and Indefinite Articles'),
  TopicTranslation(
      topicCode: 'definite_and_indefinite_articles',
      translationLanguage: Language.Spanish,
      translation: 'Artículos Definidos e Indefinidos'),

  // preterite_regular_verbs
  TopicTranslation(
      topicCode: 'preterite_regular_verbs',
      translationLanguage: Language.English,
      translation: 'Preterite (regular verbs)'),
  TopicTranslation(
      topicCode: 'preterite_regular_verbs',
      translationLanguage: Language.Spanish,
      translation: 'Pretérito (verbos regulares)'),

  // preterite_irregular_verbs
  TopicTranslation(
      topicCode: 'preterite_irregular_verbs',
      translationLanguage: Language.English,
      translation: 'Preterite (irregular verbs)'),
  TopicTranslation(
      topicCode: 'preterite_irregular_verbs',
      translationLanguage: Language.Spanish,
      translation: 'Pretérito (verbos irregulares)'),

  // imperfect_tense
  TopicTranslation(
      topicCode: 'imperfect_tense',
      translationLanguage: Language.English,
      translation: 'Imperfect Tense'),
  TopicTranslation(
      topicCode: 'imperfect_tense',
      translationLanguage: Language.Spanish,
      translation: 'Imperfecto'),

  // present_progressive
  TopicTranslation(
      topicCode: 'present_progressive',
      translationLanguage: Language.English,
      translation: 'Present Progressive'),
  TopicTranslation(
      topicCode: 'present_progressive',
      translationLanguage: Language.Spanish,
      translation: 'Presente Progresivo'),

  // near_future_ir_a_infinitive
  TopicTranslation(
      topicCode: 'near_future_ir_a_infinitive',
      translationLanguage: Language.English,
      translation: 'Near Future (ir a + infinitive)'),
  TopicTranslation(
      topicCode: 'near_future_ir_a_infinitive',
      translationLanguage: Language.Spanish,
      translation: 'Futuro Próximo (ir a + infinitivo)'),

  // present_perfect
  TopicTranslation(
      topicCode: 'present_perfect',
      translationLanguage: Language.English,
      translation: 'Present Perfect'),
  TopicTranslation(
      topicCode: 'present_perfect',
      translationLanguage: Language.Spanish,
      translation: 'Presente Perfecto'),

  // direct_and_indirect_object_pronouns
  TopicTranslation(
      topicCode: 'direct_and_indirect_object_pronouns',
      translationLanguage: Language.English,
      translation: 'Direct and Indirect Object Pronouns'),
  TopicTranslation(
      topicCode: 'direct_and_indirect_object_pronouns',
      translationLanguage: Language.Spanish,
      translation: 'Pronombres de Objeto Directo e Indirecto'),

  // comparatives_and_superlatives
  TopicTranslation(
      topicCode: 'comparatives_and_superlatives',
      translationLanguage: Language.English,
      translation: 'Comparatives and Superlatives'),
  TopicTranslation(
      topicCode: 'comparatives_and_superlatives',
      translationLanguage: Language.Spanish,
      translation: 'Comparativos y Superlativos'),

  // subjunctive_mood_present
  TopicTranslation(
      topicCode: 'subjunctive_mood_present',
      translationLanguage: Language.English,
      translation: 'Subjunctive Mood (present)'),
  TopicTranslation(
      topicCode: 'subjunctive_mood_present',
      translationLanguage: Language.Spanish,
      translation: 'Modo Subjuntivo (presente)'),

  // prepositions_of_time_and_place
  TopicTranslation(
      topicCode: 'prepositions_of_time_and_place',
      translationLanguage: Language.English,
      translation: 'Prepositions of Time and Place'),
  TopicTranslation(
      topicCode: 'prepositions_of_time_and_place',
      translationLanguage: Language.Spanish,
      translation: 'Preposiciones de Tiempo y Lugar'),

  // passive_voice
  TopicTranslation(
      topicCode: 'passive_voice',
      translationLanguage: Language.English,
      translation: 'Passive Voice'),
  TopicTranslation(
      topicCode: 'passive_voice',
      translationLanguage: Language.Spanish,
      translation: 'Voz Pasiva'),
];
