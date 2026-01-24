import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/language/topic_translation.dart';

final List<GrammarTopic> englishGrammarTopics = [
  GrammarTopic(
      topicTitle: 'Present Simple (be)',
      topicCode: 'present_simple_be',
      topicLearningOrder: 1,
      cefrLevel: CEFR.A1,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Present Simple (other verbs)',
      topicCode: 'present_simple_other_verbs',
      topicLearningOrder: 2,
      cefrLevel: CEFR.A1,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Nouns (singular, plural, countable, uncountable)',
      topicCode: 'nouns_singular_plural_countable_uncountable',
      topicLearningOrder: 3,
      cefrLevel: CEFR.A1,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Articles (a/an, the)',
      topicCode: 'articles_a_an_the',
      topicLearningOrder: 4,
      cefrLevel: CEFR.A1,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Past Simple (be)',
      topicCode: 'past_simple_be',
      topicLearningOrder: 5,
      cefrLevel: CEFR.A2,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Past Simple (regular verbs)',
      topicCode: 'past_simple_regular_verbs',
      topicLearningOrder: 6,
      cefrLevel: CEFR.A2,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Past Simple (irregular verbs)',
      topicCode: 'past_simple_irregular_verbs',
      topicLearningOrder: 7,
      cefrLevel: CEFR.A2,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Present Continuous',
      topicCode: 'present_continuous',
      topicLearningOrder: 8,
      cefrLevel: CEFR.A2,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Future Simple (will/be going to)',
      topicCode: 'future_simple_will_be_going_to',
      topicLearningOrder: 9,
      cefrLevel: CEFR.A2,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Present Perfect',
      topicCode: 'present_perfect',
      topicLearningOrder: 10,
      cefrLevel: CEFR.B1,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Modals (can, should, must)',
      topicCode: 'modals_can_should_must',
      topicLearningOrder: 11,
      cefrLevel: CEFR.B1,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Comparatives and Superlatives',
      topicCode: 'comparatives_and_superlatives',
      topicLearningOrder: 12,
      cefrLevel: CEFR.B1,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Conditionals (zero and first)',
      topicCode: 'conditionals_zero_and_first',
      topicLearningOrder: 13,
      cefrLevel: CEFR.B1,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Prepositions of time and place',
      topicCode: 'prepositions_of_time_and_place',
      topicLearningOrder: 14,
      cefrLevel: CEFR.B1,
      language: Language.English),
  GrammarTopic(
      topicTitle: 'Passive Voice (present and past simple)',
      topicCode: 'passive_voice_present_and_past_simple',
      topicLearningOrder: 15,
      cefrLevel: CEFR.B2,
      language: Language.English),
];

final List<TopicTranslation> englishTopicTranslations = [
  // present_simple_be
  TopicTranslation(
      topicCode: 'present_simple_be',
      translationLanguage: Language.English,
      translation: 'Present Simple (be)'),
  TopicTranslation(
      topicCode: 'present_simple_be',
      translationLanguage: Language.Spanish,
      translation: 'Presente Simple (ser/estar)'),

  // present_simple_other_verbs
  TopicTranslation(
      topicCode: 'present_simple_other_verbs',
      translationLanguage: Language.English,
      translation: 'Present Simple (other verbs)'),
  TopicTranslation(
      topicCode: 'present_simple_other_verbs',
      translationLanguage: Language.Spanish,
      translation: 'Presente Simple (otros verbos)'),

  // nouns_singular_plural_countable_uncountable
  TopicTranslation(
      topicCode: 'nouns_singular_plural_countable_uncountable',
      translationLanguage: Language.English,
      translation: 'Nouns (singular, plural, countable, uncountable)'),
  TopicTranslation(
      topicCode: 'nouns_singular_plural_countable_uncountable',
      translationLanguage: Language.Spanish,
      translation: 'Sustantivos (singular, plural, contable, incontable)'),

  // articles_a_an_the
  TopicTranslation(
      topicCode: 'articles_a_an_the',
      translationLanguage: Language.English,
      translation: 'Articles (a/an, the)'),
  TopicTranslation(
      topicCode: 'articles_a_an_the',
      translationLanguage: Language.Spanish,
      translation: 'Artículos (a/an, the)'),

  // past_simple_be
  TopicTranslation(
      topicCode: 'past_simple_be',
      translationLanguage: Language.English,
      translation: 'Past Simple (be)'),
  TopicTranslation(
      topicCode: 'past_simple_be',
      translationLanguage: Language.Spanish,
      translation: 'Pasado Simple (ser/estar)'),

  // past_simple_regular_verbs
  TopicTranslation(
      topicCode: 'past_simple_regular_verbs',
      translationLanguage: Language.English,
      translation: 'Past Simple (regular verbs)'),
  TopicTranslation(
      topicCode: 'past_simple_regular_verbs',
      translationLanguage: Language.Spanish,
      translation: 'Pasado Simple (verbos regulares)'),

  // past_simple_irregular_verbs
  TopicTranslation(
      topicCode: 'past_simple_irregular_verbs',
      translationLanguage: Language.English,
      translation: 'Past Simple (irregular verbs)'),
  TopicTranslation(
      topicCode: 'past_simple_irregular_verbs',
      translationLanguage: Language.Spanish,
      translation: 'Pasado Simple (verbos irregulares)'),

  // present_continuous
  TopicTranslation(
      topicCode: 'present_continuous',
      translationLanguage: Language.English,
      translation: 'Present Continuous'),
  TopicTranslation(
      topicCode: 'present_continuous',
      translationLanguage: Language.Spanish,
      translation: 'Presente Continuo'),

  // future_simple_will_be_going_to
  TopicTranslation(
      topicCode: 'future_simple_will_be_going_to',
      translationLanguage: Language.English,
      translation: 'Future Simple (will/be going to)'),
  TopicTranslation(
      topicCode: 'future_simple_will_be_going_to',
      translationLanguage: Language.Spanish,
      translation: 'Futuro Simple (will/be going to)'),

  // present_perfect
  TopicTranslation(
      topicCode: 'present_perfect',
      translationLanguage: Language.English,
      translation: 'Present Perfect'),
  TopicTranslation(
      topicCode: 'present_perfect',
      translationLanguage: Language.Spanish,
      translation: 'Presente Perfecto'),

  // modals_can_should_must
  TopicTranslation(
      topicCode: 'modals_can_should_must',
      translationLanguage: Language.English,
      translation: 'Modals (can, should, must)'),
  TopicTranslation(
      topicCode: 'modals_can_should_must',
      translationLanguage: Language.Spanish,
      translation: 'Verbos Modales (can, should, must)'),

  // comparatives_and_superlatives
  TopicTranslation(
      topicCode: 'comparatives_and_superlatives',
      translationLanguage: Language.English,
      translation: 'Comparatives and Superlatives'),
  TopicTranslation(
      topicCode: 'comparatives_and_superlatives',
      translationLanguage: Language.Spanish,
      translation: 'Comparativos y Superlativos'),

  // conditionals_zero_and_first
  TopicTranslation(
      topicCode: 'conditionals_zero_and_first',
      translationLanguage: Language.English,
      translation: 'Conditionals (zero and first)'),
  TopicTranslation(
      topicCode: 'conditionals_zero_and_first',
      translationLanguage: Language.Spanish,
      translation: 'Condicionales (cero y primero)'),

  // prepositions_of_time_and_place
  TopicTranslation(
      topicCode: 'prepositions_of_time_and_place',
      translationLanguage: Language.English,
      translation: 'Prepositions of time and place'),
  TopicTranslation(
      topicCode: 'prepositions_of_time_and_place',
      translationLanguage: Language.Spanish,
      translation: 'Preposiciones de tiempo y lugar'),

  // passive_voice_present_and_past_simple
  TopicTranslation(
      topicCode: 'passive_voice_present_and_past_simple',
      translationLanguage: Language.English,
      translation: 'Passive Voice (present and past simple)'),
  TopicTranslation(
      topicCode: 'passive_voice_present_and_past_simple',
      translationLanguage: Language.Spanish,
      translation: 'Voz Pasiva (presente y pasado simple)'),
];
