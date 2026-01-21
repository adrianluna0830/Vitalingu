// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar_topic.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetGrammarTopicCollection on Isar {
  IsarCollection<int, GrammarTopic> get grammarTopics => this.collection();
}

final GrammarTopicSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'GrammarTopic',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(name: 'topicLearningOrder', type: IsarType.long),
      IsarPropertySchema(
        name: 'cefrLevel',
        type: IsarType.byte,

        enumMap: {"A1": 0, "A2": 1, "B1": 2, "B2": 3, "C1": 4, "C2": 5},
      ),
      IsarPropertySchema(
        name: 'language',
        type: IsarType.byte,

        enumMap: {"English": 0, "Spanish": 1},
      ),
      IsarPropertySchema(name: 'topicTitle', type: IsarType.string),
    ],
    indexes: [
      IsarIndexSchema(
        name: 'language',
        properties: ["language"],
        unique: false,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<int, GrammarTopic>(
    serialize: serializeGrammarTopic,
    deserialize: deserializeGrammarTopic,
    deserializeProperty: deserializeGrammarTopicProp,
  ),
  getEmbeddedSchemas: () => [],
);

@isarProtected
int serializeGrammarTopic(IsarWriter writer, GrammarTopic object) {
  IsarCore.writeLong(writer, 1, object.topicLearningOrder);
  IsarCore.writeByte(writer, 2, object.cefrLevel.index);
  IsarCore.writeByte(writer, 3, object.language.index);
  IsarCore.writeString(writer, 4, object.topicTitle);
  return object.id;
}

@isarProtected
GrammarTopic deserializeGrammarTopic(IsarReader reader) {
  final int _topicLearningOrder;
  _topicLearningOrder = IsarCore.readLong(reader, 1);
  final CEFR _cefrLevel;
  {
    if (IsarCore.readNull(reader, 2)) {
      _cefrLevel = CEFR.A1;
    } else {
      _cefrLevel =
          _grammarTopicCefrLevel[IsarCore.readByte(reader, 2)] ?? CEFR.A1;
    }
  }
  final Language _language;
  {
    if (IsarCore.readNull(reader, 3)) {
      _language = Language.English;
    } else {
      _language =
          _grammarTopicLanguage[IsarCore.readByte(reader, 3)] ??
          Language.English;
    }
  }
  final String _topicTitle;
  _topicTitle = IsarCore.readString(reader, 4) ?? '';
  final object = GrammarTopic(
    topicLearningOrder: _topicLearningOrder,
    cefrLevel: _cefrLevel,
    language: _language,
    topicTitle: _topicTitle,
  );
  object.id = IsarCore.readId(reader);
  return object;
}

@isarProtected
dynamic deserializeGrammarTopicProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readLong(reader, 1);
    case 2:
      {
        if (IsarCore.readNull(reader, 2)) {
          return CEFR.A1;
        } else {
          return _grammarTopicCefrLevel[IsarCore.readByte(reader, 2)] ??
              CEFR.A1;
        }
      }
    case 3:
      {
        if (IsarCore.readNull(reader, 3)) {
          return Language.English;
        } else {
          return _grammarTopicLanguage[IsarCore.readByte(reader, 3)] ??
              Language.English;
        }
      }
    case 4:
      return IsarCore.readString(reader, 4) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _GrammarTopicUpdate {
  bool call({
    required int id,
    int? topicLearningOrder,
    CEFR? cefrLevel,
    Language? language,
    String? topicTitle,
  });
}

class _GrammarTopicUpdateImpl implements _GrammarTopicUpdate {
  const _GrammarTopicUpdateImpl(this.collection);

  final IsarCollection<int, GrammarTopic> collection;

  @override
  bool call({
    required int id,
    Object? topicLearningOrder = ignore,
    Object? cefrLevel = ignore,
    Object? language = ignore,
    Object? topicTitle = ignore,
  }) {
    return collection.updateProperties(
          [id],
          {
            if (topicLearningOrder != ignore) 1: topicLearningOrder as int?,
            if (cefrLevel != ignore) 2: cefrLevel as CEFR?,
            if (language != ignore) 3: language as Language?,
            if (topicTitle != ignore) 4: topicTitle as String?,
          },
        ) >
        0;
  }
}

sealed class _GrammarTopicUpdateAll {
  int call({
    required List<int> id,
    int? topicLearningOrder,
    CEFR? cefrLevel,
    Language? language,
    String? topicTitle,
  });
}

class _GrammarTopicUpdateAllImpl implements _GrammarTopicUpdateAll {
  const _GrammarTopicUpdateAllImpl(this.collection);

  final IsarCollection<int, GrammarTopic> collection;

  @override
  int call({
    required List<int> id,
    Object? topicLearningOrder = ignore,
    Object? cefrLevel = ignore,
    Object? language = ignore,
    Object? topicTitle = ignore,
  }) {
    return collection.updateProperties(id, {
      if (topicLearningOrder != ignore) 1: topicLearningOrder as int?,
      if (cefrLevel != ignore) 2: cefrLevel as CEFR?,
      if (language != ignore) 3: language as Language?,
      if (topicTitle != ignore) 4: topicTitle as String?,
    });
  }
}

extension GrammarTopicUpdate on IsarCollection<int, GrammarTopic> {
  _GrammarTopicUpdate get update => _GrammarTopicUpdateImpl(this);

  _GrammarTopicUpdateAll get updateAll => _GrammarTopicUpdateAllImpl(this);
}

sealed class _GrammarTopicQueryUpdate {
  int call({
    int? topicLearningOrder,
    CEFR? cefrLevel,
    Language? language,
    String? topicTitle,
  });
}

class _GrammarTopicQueryUpdateImpl implements _GrammarTopicQueryUpdate {
  const _GrammarTopicQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<GrammarTopic> query;
  final int? limit;

  @override
  int call({
    Object? topicLearningOrder = ignore,
    Object? cefrLevel = ignore,
    Object? language = ignore,
    Object? topicTitle = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (topicLearningOrder != ignore) 1: topicLearningOrder as int?,
      if (cefrLevel != ignore) 2: cefrLevel as CEFR?,
      if (language != ignore) 3: language as Language?,
      if (topicTitle != ignore) 4: topicTitle as String?,
    });
  }
}

extension GrammarTopicQueryUpdate on IsarQuery<GrammarTopic> {
  _GrammarTopicQueryUpdate get updateFirst =>
      _GrammarTopicQueryUpdateImpl(this, limit: 1);

  _GrammarTopicQueryUpdate get updateAll => _GrammarTopicQueryUpdateImpl(this);
}

class _GrammarTopicQueryBuilderUpdateImpl implements _GrammarTopicQueryUpdate {
  const _GrammarTopicQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<GrammarTopic, GrammarTopic, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? topicLearningOrder = ignore,
    Object? cefrLevel = ignore,
    Object? language = ignore,
    Object? topicTitle = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (topicLearningOrder != ignore) 1: topicLearningOrder as int?,
        if (cefrLevel != ignore) 2: cefrLevel as CEFR?,
        if (language != ignore) 3: language as Language?,
        if (topicTitle != ignore) 4: topicTitle as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension GrammarTopicQueryBuilderUpdate
    on QueryBuilder<GrammarTopic, GrammarTopic, QOperations> {
  _GrammarTopicQueryUpdate get updateFirst =>
      _GrammarTopicQueryBuilderUpdateImpl(this, limit: 1);

  _GrammarTopicQueryUpdate get updateAll =>
      _GrammarTopicQueryBuilderUpdateImpl(this);
}

const _grammarTopicCefrLevel = {
  0: CEFR.A1,
  1: CEFR.A2,
  2: CEFR.B1,
  3: CEFR.B2,
  4: CEFR.C1,
  5: CEFR.C2,
};
const _grammarTopicLanguage = {0: Language.English, 1: Language.Spanish};

extension GrammarTopicQueryFilter
    on QueryBuilder<GrammarTopic, GrammarTopic, QFilterCondition> {
  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  idGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 0, value: value));
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  idLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 0, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicLearningOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicLearningOrderGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicLearningOrderGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicLearningOrderLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 1, value: value));
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicLearningOrderLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicLearningOrderBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 1, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  cefrLevelEqualTo(CEFR value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 2, value: value.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  cefrLevelGreaterThan(CEFR value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 2, value: value.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  cefrLevelGreaterThanOrEqualTo(CEFR value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 2, value: value.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  cefrLevelLessThan(CEFR value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 2, value: value.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  cefrLevelLessThanOrEqualTo(CEFR value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 2, value: value.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  cefrLevelBetween(CEFR lower, CEFR upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 2, lower: lower.index, upper: upper.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  languageEqualTo(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 3, value: value.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  languageGreaterThan(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 3, value: value.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  languageGreaterThanOrEqualTo(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 3, value: value.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  languageLessThan(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 3, value: value.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  languageLessThanOrEqualTo(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 3, value: value.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  languageBetween(Language lower, Language upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 3, lower: lower.index, upper: upper.index),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 4, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleGreaterThan(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleGreaterThanOrEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleLessThan(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 4, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleLessThanOrEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleBetween(String lower, String upper, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(property: 4, value: ''),
      );
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterFilterCondition>
  topicTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(property: 4, value: ''),
      );
    });
  }
}

extension GrammarTopicQueryObject
    on QueryBuilder<GrammarTopic, GrammarTopic, QFilterCondition> {}

extension GrammarTopicQuerySortBy
    on QueryBuilder<GrammarTopic, GrammarTopic, QSortBy> {
  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy>
  sortByTopicLearningOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy>
  sortByTopicLearningOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> sortByCefrLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> sortByCefrLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> sortByTopicTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> sortByTopicTitleDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension GrammarTopicQuerySortThenBy
    on QueryBuilder<GrammarTopic, GrammarTopic, QSortThenBy> {
  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy>
  thenByTopicLearningOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy>
  thenByTopicLearningOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> thenByCefrLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> thenByCefrLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> thenByTopicTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterSortBy> thenByTopicTitleDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension GrammarTopicQueryWhereDistinct
    on QueryBuilder<GrammarTopic, GrammarTopic, QDistinct> {
  QueryBuilder<GrammarTopic, GrammarTopic, QAfterDistinct>
  distinctByTopicLearningOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterDistinct>
  distinctByCefrLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterDistinct>
  distinctByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<GrammarTopic, GrammarTopic, QAfterDistinct>
  distinctByTopicTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }
}

extension GrammarTopicQueryProperty1
    on QueryBuilder<GrammarTopic, GrammarTopic, QProperty> {
  QueryBuilder<GrammarTopic, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<GrammarTopic, int, QAfterProperty> topicLearningOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<GrammarTopic, CEFR, QAfterProperty> cefrLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<GrammarTopic, Language, QAfterProperty> languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<GrammarTopic, String, QAfterProperty> topicTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }
}

extension GrammarTopicQueryProperty2<R>
    on QueryBuilder<GrammarTopic, R, QAfterProperty> {
  QueryBuilder<GrammarTopic, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<GrammarTopic, (R, int), QAfterProperty>
  topicLearningOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<GrammarTopic, (R, CEFR), QAfterProperty> cefrLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<GrammarTopic, (R, Language), QAfterProperty> languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<GrammarTopic, (R, String), QAfterProperty> topicTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }
}

extension GrammarTopicQueryProperty3<R1, R2>
    on QueryBuilder<GrammarTopic, (R1, R2), QAfterProperty> {
  QueryBuilder<GrammarTopic, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<GrammarTopic, (R1, R2, int), QOperations>
  topicLearningOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<GrammarTopic, (R1, R2, CEFR), QOperations> cefrLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<GrammarTopic, (R1, R2, Language), QOperations>
  languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<GrammarTopic, (R1, R2, String), QOperations>
  topicTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }
}
