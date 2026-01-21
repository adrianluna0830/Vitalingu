// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_language_skills_data.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetUserLanguageSkillsDataCollection on Isar {
  IsarCollection<int, UserLanguageSkillsData> get userLanguageSkillsDatas =>
      this.collection();
}

final UserLanguageSkillsDataSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'UserLanguageSkillsData',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'language',
        type: IsarType.byte,

        enumMap: {"English": 0, "Spanish": 1},
      ),
      IsarPropertySchema(
        name: 'normalizedListeningProgress',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'normalizedSpeakingProgress',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'normalizedReadingProgress',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'normalizedWritingProgress',
        type: IsarType.double,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, UserLanguageSkillsData>(
    serialize: serializeUserLanguageSkillsData,
    deserialize: deserializeUserLanguageSkillsData,
    deserializeProperty: deserializeUserLanguageSkillsDataProp,
  ),
  getEmbeddedSchemas: () => [],
);

@isarProtected
int serializeUserLanguageSkillsData(
  IsarWriter writer,
  UserLanguageSkillsData object,
) {
  IsarCore.writeByte(writer, 1, object.language.index);
  IsarCore.writeDouble(writer, 2, object.normalizedListeningProgress);
  IsarCore.writeDouble(writer, 3, object.normalizedSpeakingProgress);
  IsarCore.writeDouble(writer, 4, object.normalizedReadingProgress);
  IsarCore.writeDouble(writer, 5, object.normalizedWritingProgress);
  return object.id;
}

@isarProtected
UserLanguageSkillsData deserializeUserLanguageSkillsData(IsarReader reader) {
  final Language _language;
  {
    if (IsarCore.readNull(reader, 1)) {
      _language = Language.English;
    } else {
      _language =
          _userLanguageSkillsDataLanguage[IsarCore.readByte(reader, 1)] ??
          Language.English;
    }
  }
  final double _normalizedListeningProgress;
  _normalizedListeningProgress = IsarCore.readDouble(reader, 2);
  final double _normalizedSpeakingProgress;
  _normalizedSpeakingProgress = IsarCore.readDouble(reader, 3);
  final double _normalizedReadingProgress;
  _normalizedReadingProgress = IsarCore.readDouble(reader, 4);
  final double _normalizedWritingProgress;
  _normalizedWritingProgress = IsarCore.readDouble(reader, 5);
  final object = UserLanguageSkillsData(
    language: _language,
    normalizedListeningProgress: _normalizedListeningProgress,
    normalizedSpeakingProgress: _normalizedSpeakingProgress,
    normalizedReadingProgress: _normalizedReadingProgress,
    normalizedWritingProgress: _normalizedWritingProgress,
  );
  object.id = IsarCore.readId(reader);
  return object;
}

@isarProtected
dynamic deserializeUserLanguageSkillsDataProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      {
        if (IsarCore.readNull(reader, 1)) {
          return Language.English;
        } else {
          return _userLanguageSkillsDataLanguage[IsarCore.readByte(
                reader,
                1,
              )] ??
              Language.English;
        }
      }
    case 2:
      return IsarCore.readDouble(reader, 2);
    case 3:
      return IsarCore.readDouble(reader, 3);
    case 4:
      return IsarCore.readDouble(reader, 4);
    case 5:
      return IsarCore.readDouble(reader, 5);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _UserLanguageSkillsDataUpdate {
  bool call({
    required int id,
    Language? language,
    double? normalizedListeningProgress,
    double? normalizedSpeakingProgress,
    double? normalizedReadingProgress,
    double? normalizedWritingProgress,
  });
}

class _UserLanguageSkillsDataUpdateImpl
    implements _UserLanguageSkillsDataUpdate {
  const _UserLanguageSkillsDataUpdateImpl(this.collection);

  final IsarCollection<int, UserLanguageSkillsData> collection;

  @override
  bool call({
    required int id,
    Object? language = ignore,
    Object? normalizedListeningProgress = ignore,
    Object? normalizedSpeakingProgress = ignore,
    Object? normalizedReadingProgress = ignore,
    Object? normalizedWritingProgress = ignore,
  }) {
    return collection.updateProperties(
          [id],
          {
            if (language != ignore) 1: language as Language?,
            if (normalizedListeningProgress != ignore)
              2: normalizedListeningProgress as double?,
            if (normalizedSpeakingProgress != ignore)
              3: normalizedSpeakingProgress as double?,
            if (normalizedReadingProgress != ignore)
              4: normalizedReadingProgress as double?,
            if (normalizedWritingProgress != ignore)
              5: normalizedWritingProgress as double?,
          },
        ) >
        0;
  }
}

sealed class _UserLanguageSkillsDataUpdateAll {
  int call({
    required List<int> id,
    Language? language,
    double? normalizedListeningProgress,
    double? normalizedSpeakingProgress,
    double? normalizedReadingProgress,
    double? normalizedWritingProgress,
  });
}

class _UserLanguageSkillsDataUpdateAllImpl
    implements _UserLanguageSkillsDataUpdateAll {
  const _UserLanguageSkillsDataUpdateAllImpl(this.collection);

  final IsarCollection<int, UserLanguageSkillsData> collection;

  @override
  int call({
    required List<int> id,
    Object? language = ignore,
    Object? normalizedListeningProgress = ignore,
    Object? normalizedSpeakingProgress = ignore,
    Object? normalizedReadingProgress = ignore,
    Object? normalizedWritingProgress = ignore,
  }) {
    return collection.updateProperties(id, {
      if (language != ignore) 1: language as Language?,
      if (normalizedListeningProgress != ignore)
        2: normalizedListeningProgress as double?,
      if (normalizedSpeakingProgress != ignore)
        3: normalizedSpeakingProgress as double?,
      if (normalizedReadingProgress != ignore)
        4: normalizedReadingProgress as double?,
      if (normalizedWritingProgress != ignore)
        5: normalizedWritingProgress as double?,
    });
  }
}

extension UserLanguageSkillsDataUpdate
    on IsarCollection<int, UserLanguageSkillsData> {
  _UserLanguageSkillsDataUpdate get update =>
      _UserLanguageSkillsDataUpdateImpl(this);

  _UserLanguageSkillsDataUpdateAll get updateAll =>
      _UserLanguageSkillsDataUpdateAllImpl(this);
}

sealed class _UserLanguageSkillsDataQueryUpdate {
  int call({
    Language? language,
    double? normalizedListeningProgress,
    double? normalizedSpeakingProgress,
    double? normalizedReadingProgress,
    double? normalizedWritingProgress,
  });
}

class _UserLanguageSkillsDataQueryUpdateImpl
    implements _UserLanguageSkillsDataQueryUpdate {
  const _UserLanguageSkillsDataQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<UserLanguageSkillsData> query;
  final int? limit;

  @override
  int call({
    Object? language = ignore,
    Object? normalizedListeningProgress = ignore,
    Object? normalizedSpeakingProgress = ignore,
    Object? normalizedReadingProgress = ignore,
    Object? normalizedWritingProgress = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (language != ignore) 1: language as Language?,
      if (normalizedListeningProgress != ignore)
        2: normalizedListeningProgress as double?,
      if (normalizedSpeakingProgress != ignore)
        3: normalizedSpeakingProgress as double?,
      if (normalizedReadingProgress != ignore)
        4: normalizedReadingProgress as double?,
      if (normalizedWritingProgress != ignore)
        5: normalizedWritingProgress as double?,
    });
  }
}

extension UserLanguageSkillsDataQueryUpdate
    on IsarQuery<UserLanguageSkillsData> {
  _UserLanguageSkillsDataQueryUpdate get updateFirst =>
      _UserLanguageSkillsDataQueryUpdateImpl(this, limit: 1);

  _UserLanguageSkillsDataQueryUpdate get updateAll =>
      _UserLanguageSkillsDataQueryUpdateImpl(this);
}

class _UserLanguageSkillsDataQueryBuilderUpdateImpl
    implements _UserLanguageSkillsDataQueryUpdate {
  const _UserLanguageSkillsDataQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QOperations
  >
  query;
  final int? limit;

  @override
  int call({
    Object? language = ignore,
    Object? normalizedListeningProgress = ignore,
    Object? normalizedSpeakingProgress = ignore,
    Object? normalizedReadingProgress = ignore,
    Object? normalizedWritingProgress = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (language != ignore) 1: language as Language?,
        if (normalizedListeningProgress != ignore)
          2: normalizedListeningProgress as double?,
        if (normalizedSpeakingProgress != ignore)
          3: normalizedSpeakingProgress as double?,
        if (normalizedReadingProgress != ignore)
          4: normalizedReadingProgress as double?,
        if (normalizedWritingProgress != ignore)
          5: normalizedWritingProgress as double?,
      });
    } finally {
      q.close();
    }
  }
}

extension UserLanguageSkillsDataQueryBuilderUpdate
    on
        QueryBuilder<
          UserLanguageSkillsData,
          UserLanguageSkillsData,
          QOperations
        > {
  _UserLanguageSkillsDataQueryUpdate get updateFirst =>
      _UserLanguageSkillsDataQueryBuilderUpdateImpl(this, limit: 1);

  _UserLanguageSkillsDataQueryUpdate get updateAll =>
      _UserLanguageSkillsDataQueryBuilderUpdateImpl(this);
}

const _userLanguageSkillsDataLanguage = {
  0: Language.English,
  1: Language.Spanish,
};

extension UserLanguageSkillsDataQueryFilter
    on
        QueryBuilder<
          UserLanguageSkillsData,
          UserLanguageSkillsData,
          QFilterCondition
        > {
  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  idGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  idGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  idLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 0, value: value));
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  idLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  idBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 0, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  languageEqualTo(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 1, value: value.index),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  languageGreaterThan(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 1, value: value.index),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  languageGreaterThanOrEqualTo(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 1, value: value.index),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  languageLessThan(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 1, value: value.index),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  languageLessThanOrEqualTo(Language value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 1, value: value.index),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  languageBetween(Language lower, Language upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 1, lower: lower.index, upper: upper.index),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedListeningProgressEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedListeningProgressGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedListeningProgressGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedListeningProgressLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedListeningProgressLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedListeningProgressBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedSpeakingProgressEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 3, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedSpeakingProgressGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 3, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedSpeakingProgressGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 3, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedSpeakingProgressLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 3, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedSpeakingProgressLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 3, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedSpeakingProgressBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedReadingProgressEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 4, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedReadingProgressGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 4, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedReadingProgressGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 4, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedReadingProgressLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 4, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedReadingProgressLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 4, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedReadingProgressBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedWritingProgressEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 5, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedWritingProgressGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 5, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedWritingProgressGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 5, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedWritingProgressLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 5, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedWritingProgressLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 5, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<
    UserLanguageSkillsData,
    UserLanguageSkillsData,
    QAfterFilterCondition
  >
  normalizedWritingProgressBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,

          epsilon: epsilon,
        ),
      );
    });
  }
}

extension UserLanguageSkillsDataQueryObject
    on
        QueryBuilder<
          UserLanguageSkillsData,
          UserLanguageSkillsData,
          QFilterCondition
        > {}

extension UserLanguageSkillsDataQuerySortBy
    on QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QSortBy> {
  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortByNormalizedListeningProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortByNormalizedListeningProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortByNormalizedSpeakingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortByNormalizedSpeakingProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortByNormalizedReadingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortByNormalizedReadingProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortByNormalizedWritingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  sortByNormalizedWritingProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension UserLanguageSkillsDataQuerySortThenBy
    on
        QueryBuilder<
          UserLanguageSkillsData,
          UserLanguageSkillsData,
          QSortThenBy
        > {
  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenByNormalizedListeningProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenByNormalizedListeningProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenByNormalizedSpeakingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenByNormalizedSpeakingProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenByNormalizedReadingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenByNormalizedReadingProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenByNormalizedWritingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterSortBy>
  thenByNormalizedWritingProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension UserLanguageSkillsDataQueryWhereDistinct
    on QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QDistinct> {
  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterDistinct>
  distinctByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterDistinct>
  distinctByNormalizedListeningProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterDistinct>
  distinctByNormalizedSpeakingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterDistinct>
  distinctByNormalizedReadingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QAfterDistinct>
  distinctByNormalizedWritingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }
}

extension UserLanguageSkillsDataQueryProperty1
    on QueryBuilder<UserLanguageSkillsData, UserLanguageSkillsData, QProperty> {
  QueryBuilder<UserLanguageSkillsData, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserLanguageSkillsData, Language, QAfterProperty>
  languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserLanguageSkillsData, double, QAfterProperty>
  normalizedListeningProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserLanguageSkillsData, double, QAfterProperty>
  normalizedSpeakingProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<UserLanguageSkillsData, double, QAfterProperty>
  normalizedReadingProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<UserLanguageSkillsData, double, QAfterProperty>
  normalizedWritingProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension UserLanguageSkillsDataQueryProperty2<R>
    on QueryBuilder<UserLanguageSkillsData, R, QAfterProperty> {
  QueryBuilder<UserLanguageSkillsData, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserLanguageSkillsData, (R, Language), QAfterProperty>
  languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserLanguageSkillsData, (R, double), QAfterProperty>
  normalizedListeningProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserLanguageSkillsData, (R, double), QAfterProperty>
  normalizedSpeakingProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<UserLanguageSkillsData, (R, double), QAfterProperty>
  normalizedReadingProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<UserLanguageSkillsData, (R, double), QAfterProperty>
  normalizedWritingProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension UserLanguageSkillsDataQueryProperty3<R1, R2>
    on QueryBuilder<UserLanguageSkillsData, (R1, R2), QAfterProperty> {
  QueryBuilder<UserLanguageSkillsData, (R1, R2, int), QOperations>
  idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserLanguageSkillsData, (R1, R2, Language), QOperations>
  languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserLanguageSkillsData, (R1, R2, double), QOperations>
  normalizedListeningProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserLanguageSkillsData, (R1, R2, double), QOperations>
  normalizedSpeakingProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<UserLanguageSkillsData, (R1, R2, double), QOperations>
  normalizedReadingProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<UserLanguageSkillsData, (R1, R2, double), QOperations>
  normalizedWritingProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}
