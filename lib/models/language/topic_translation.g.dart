// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_translation.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetTopicTranslationCollection on Isar {
  IsarCollection<int, TopicTranslation> get topicTranslations =>
      this.collection();
}

final TopicTranslationSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'TopicTranslation',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(name: 'translation', type: IsarType.string),
      IsarPropertySchema(
        name: 'translationLanguage',
        type: IsarType.byte,

        enumMap: {"English": 0, "Spanish": 1},
      ),
      IsarPropertySchema(name: 'topicId', type: IsarType.long),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, TopicTranslation>(
    serialize: serializeTopicTranslation,
    deserialize: deserializeTopicTranslation,
    deserializeProperty: deserializeTopicTranslationProp,
  ),
  getEmbeddedSchemas: () => [],
);

@isarProtected
int serializeTopicTranslation(IsarWriter writer, TopicTranslation object) {
  IsarCore.writeString(writer, 1, object.translation);
  IsarCore.writeByte(writer, 2, object.translationLanguage.index);
  IsarCore.writeLong(writer, 3, object.topicId);
  return object.id;
}

@isarProtected
TopicTranslation deserializeTopicTranslation(IsarReader reader) {
  final String _translation;
  _translation = IsarCore.readString(reader, 1) ?? '';
  final Language _translationLanguage;
  {
    if (IsarCore.readNull(reader, 2)) {
      _translationLanguage = Language.English;
    } else {
      _translationLanguage =
          _topicTranslationTranslationLanguage[IsarCore.readByte(reader, 2)] ??
          Language.English;
    }
  }
  final int _topicId;
  _topicId = IsarCore.readLong(reader, 3);
  final object = TopicTranslation(
    translation: _translation,
    translationLanguage: _translationLanguage,
    topicId: _topicId,
  );
  object.id = IsarCore.readId(reader);
  return object;
}

@isarProtected
dynamic deserializeTopicTranslationProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      {
        if (IsarCore.readNull(reader, 2)) {
          return Language.English;
        } else {
          return _topicTranslationTranslationLanguage[IsarCore.readByte(
                reader,
                2,
              )] ??
              Language.English;
        }
      }
    case 3:
      return IsarCore.readLong(reader, 3);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _TopicTranslationUpdate {
  bool call({
    required int id,
    String? translation,
    Language? translationLanguage,
    int? topicId,
  });
}

class _TopicTranslationUpdateImpl implements _TopicTranslationUpdate {
  const _TopicTranslationUpdateImpl(this.collection);

  final IsarCollection<int, TopicTranslation> collection;

  @override
  bool call({
    required int id,
    Object? translation = ignore,
    Object? translationLanguage = ignore,
    Object? topicId = ignore,
  }) {
    return collection.updateProperties(
          [id],
          {
            if (translation != ignore) 1: translation as String?,
            if (translationLanguage != ignore)
              2: translationLanguage as Language?,
            if (topicId != ignore) 3: topicId as int?,
          },
        ) >
        0;
  }
}

sealed class _TopicTranslationUpdateAll {
  int call({
    required List<int> id,
    String? translation,
    Language? translationLanguage,
    int? topicId,
  });
}

class _TopicTranslationUpdateAllImpl implements _TopicTranslationUpdateAll {
  const _TopicTranslationUpdateAllImpl(this.collection);

  final IsarCollection<int, TopicTranslation> collection;

  @override
  int call({
    required List<int> id,
    Object? translation = ignore,
    Object? translationLanguage = ignore,
    Object? topicId = ignore,
  }) {
    return collection.updateProperties(id, {
      if (translation != ignore) 1: translation as String?,
      if (translationLanguage != ignore) 2: translationLanguage as Language?,
      if (topicId != ignore) 3: topicId as int?,
    });
  }
}

extension TopicTranslationUpdate on IsarCollection<int, TopicTranslation> {
  _TopicTranslationUpdate get update => _TopicTranslationUpdateImpl(this);

  _TopicTranslationUpdateAll get updateAll =>
      _TopicTranslationUpdateAllImpl(this);
}

sealed class _TopicTranslationQueryUpdate {
  int call({String? translation, Language? translationLanguage, int? topicId});
}

class _TopicTranslationQueryUpdateImpl implements _TopicTranslationQueryUpdate {
  const _TopicTranslationQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<TopicTranslation> query;
  final int? limit;

  @override
  int call({
    Object? translation = ignore,
    Object? translationLanguage = ignore,
    Object? topicId = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (translation != ignore) 1: translation as String?,
      if (translationLanguage != ignore) 2: translationLanguage as Language?,
      if (topicId != ignore) 3: topicId as int?,
    });
  }
}

extension TopicTranslationQueryUpdate on IsarQuery<TopicTranslation> {
  _TopicTranslationQueryUpdate get updateFirst =>
      _TopicTranslationQueryUpdateImpl(this, limit: 1);

  _TopicTranslationQueryUpdate get updateAll =>
      _TopicTranslationQueryUpdateImpl(this);
}

class _TopicTranslationQueryBuilderUpdateImpl
    implements _TopicTranslationQueryUpdate {
  const _TopicTranslationQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<TopicTranslation, TopicTranslation, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? translation = ignore,
    Object? translationLanguage = ignore,
    Object? topicId = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (translation != ignore) 1: translation as String?,
        if (translationLanguage != ignore) 2: translationLanguage as Language?,
        if (topicId != ignore) 3: topicId as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension TopicTranslationQueryBuilderUpdate
    on QueryBuilder<TopicTranslation, TopicTranslation, QOperations> {
  _TopicTranslationQueryUpdate get updateFirst =>
      _TopicTranslationQueryBuilderUpdateImpl(this, limit: 1);

  _TopicTranslationQueryUpdate get updateAll =>
      _TopicTranslationQueryBuilderUpdateImpl(this);
}

const _topicTranslationTranslationLanguage = {
  0: Language.English,
  1: Language.Spanish,
};

extension TopicTranslationQueryFilter
    on QueryBuilder<TopicTranslation, TopicTranslation, QFilterCondition> {
  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  idGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  idGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  idLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 0, value: value));
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  idLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  idBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 0, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 1, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationGreaterThan(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationGreaterThanOrEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationLessThan(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 1, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationLessThanOrEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationBetween(String lower, String upper, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(property: 1, value: ''),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(property: 1, value: ''),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationLanguageEqualTo(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 2, value: value.index),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationLanguageGreaterThan(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 2, value: value.index),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationLanguageGreaterThanOrEqualTo(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 2, value: value.index),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationLanguageLessThan(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 2, value: value.index),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationLanguageLessThanOrEqualTo(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 2, value: value.index),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  translationLanguageBetween(Language lower, Language upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 2, lower: lower.index, upper: upper.index),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  topicIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  topicIdGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  topicIdGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  topicIdLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 3, value: value));
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  topicIdLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterFilterCondition>
  topicIdBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 3, lower: lower, upper: upper),
      );
    });
  }
}

extension TopicTranslationQueryObject
    on QueryBuilder<TopicTranslation, TopicTranslation, QFilterCondition> {}

extension TopicTranslationQuerySortBy
    on QueryBuilder<TopicTranslation, TopicTranslation, QSortBy> {
  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  sortByTranslation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  sortByTranslationDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  sortByTranslationLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  sortByTranslationLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  sortByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  sortByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }
}

extension TopicTranslationQuerySortThenBy
    on QueryBuilder<TopicTranslation, TopicTranslation, QSortThenBy> {
  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  thenByTranslation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  thenByTranslationDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  thenByTranslationLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  thenByTranslationLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  thenByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterSortBy>
  thenByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }
}

extension TopicTranslationQueryWhereDistinct
    on QueryBuilder<TopicTranslation, TopicTranslation, QDistinct> {
  QueryBuilder<TopicTranslation, TopicTranslation, QAfterDistinct>
  distinctByTranslation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterDistinct>
  distinctByTranslationLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<TopicTranslation, TopicTranslation, QAfterDistinct>
  distinctByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }
}

extension TopicTranslationQueryProperty1
    on QueryBuilder<TopicTranslation, TopicTranslation, QProperty> {
  QueryBuilder<TopicTranslation, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<TopicTranslation, String, QAfterProperty> translationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TopicTranslation, Language, QAfterProperty>
  translationLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TopicTranslation, int, QAfterProperty> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension TopicTranslationQueryProperty2<R>
    on QueryBuilder<TopicTranslation, R, QAfterProperty> {
  QueryBuilder<TopicTranslation, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<TopicTranslation, (R, String), QAfterProperty>
  translationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TopicTranslation, (R, Language), QAfterProperty>
  translationLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TopicTranslation, (R, int), QAfterProperty> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension TopicTranslationQueryProperty3<R1, R2>
    on QueryBuilder<TopicTranslation, (R1, R2), QAfterProperty> {
  QueryBuilder<TopicTranslation, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<TopicTranslation, (R1, R2, String), QOperations>
  translationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TopicTranslation, (R1, R2, Language), QOperations>
  translationLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TopicTranslation, (R1, R2, int), QOperations> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}
