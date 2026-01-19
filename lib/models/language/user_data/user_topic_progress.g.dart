// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_topic_progress.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetUserTopicProgressCollection on Isar {
  IsarCollection<int, UserTopicProgress> get userTopicProgress =>
      this.collection();
}

final UserTopicProgressSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'UserTopicProgress',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(name: 'globalMastery', type: IsarType.double),
      IsarPropertySchema(
        name: 'currentLocalMasteryHistory',
        type: IsarType.doubleList,
      ),
      IsarPropertySchema(name: 'topicId', type: IsarType.long),
      IsarPropertySchema(name: 'isUnlocked', type: IsarType.bool),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, UserTopicProgress>(
    serialize: serializeUserTopicProgress,
    deserialize: deserializeUserTopicProgress,
    deserializeProperty: deserializeUserTopicProgressProp,
  ),
  getEmbeddedSchemas: () => [],
);

@isarProtected
int serializeUserTopicProgress(IsarWriter writer, UserTopicProgress object) {
  IsarCore.writeDouble(writer, 1, object.globalMastery);
  {
    final list = object.currentLocalMasteryHistory;
    final listWriter = IsarCore.beginList(writer, 2, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeDouble(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeLong(writer, 3, object.topicId);
  IsarCore.writeBool(writer, 4, value: object.isUnlocked);
  return object.id;
}

@isarProtected
UserTopicProgress deserializeUserTopicProgress(IsarReader reader) {
  final int _topicId;
  _topicId = IsarCore.readLong(reader, 3);
  final object = UserTopicProgress(topicId: _topicId);
  object.id = IsarCore.readId(reader);
  object.globalMastery = IsarCore.readDouble(reader, 1);
  {
    final length = IsarCore.readList(reader, 2, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        object.currentLocalMasteryHistory = const <double>[];
      } else {
        final list = List<double>.filled(length, double.nan, growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readDouble(reader, i);
        }
        IsarCore.freeReader(reader);
        object.currentLocalMasteryHistory = list;
      }
    }
  }
  object.isUnlocked = IsarCore.readBool(reader, 4);
  return object;
}

@isarProtected
dynamic deserializeUserTopicProgressProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readDouble(reader, 1);
    case 2:
      {
        final length = IsarCore.readList(reader, 2, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <double>[];
          } else {
            final list = List<double>.filled(
              length,
              double.nan,
              growable: true,
            );
            for (var i = 0; i < length; i++) {
              list[i] = IsarCore.readDouble(reader, i);
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    case 3:
      return IsarCore.readLong(reader, 3);
    case 4:
      return IsarCore.readBool(reader, 4);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _UserTopicProgressUpdate {
  bool call({
    required int id,
    double? globalMastery,
    int? topicId,
    bool? isUnlocked,
  });
}

class _UserTopicProgressUpdateImpl implements _UserTopicProgressUpdate {
  const _UserTopicProgressUpdateImpl(this.collection);

  final IsarCollection<int, UserTopicProgress> collection;

  @override
  bool call({
    required int id,
    Object? globalMastery = ignore,
    Object? topicId = ignore,
    Object? isUnlocked = ignore,
  }) {
    return collection.updateProperties(
          [id],
          {
            if (globalMastery != ignore) 1: globalMastery as double?,
            if (topicId != ignore) 3: topicId as int?,
            if (isUnlocked != ignore) 4: isUnlocked as bool?,
          },
        ) >
        0;
  }
}

sealed class _UserTopicProgressUpdateAll {
  int call({
    required List<int> id,
    double? globalMastery,
    int? topicId,
    bool? isUnlocked,
  });
}

class _UserTopicProgressUpdateAllImpl implements _UserTopicProgressUpdateAll {
  const _UserTopicProgressUpdateAllImpl(this.collection);

  final IsarCollection<int, UserTopicProgress> collection;

  @override
  int call({
    required List<int> id,
    Object? globalMastery = ignore,
    Object? topicId = ignore,
    Object? isUnlocked = ignore,
  }) {
    return collection.updateProperties(id, {
      if (globalMastery != ignore) 1: globalMastery as double?,
      if (topicId != ignore) 3: topicId as int?,
      if (isUnlocked != ignore) 4: isUnlocked as bool?,
    });
  }
}

extension UserTopicProgressUpdate on IsarCollection<int, UserTopicProgress> {
  _UserTopicProgressUpdate get update => _UserTopicProgressUpdateImpl(this);

  _UserTopicProgressUpdateAll get updateAll =>
      _UserTopicProgressUpdateAllImpl(this);
}

sealed class _UserTopicProgressQueryUpdate {
  int call({double? globalMastery, int? topicId, bool? isUnlocked});
}

class _UserTopicProgressQueryUpdateImpl
    implements _UserTopicProgressQueryUpdate {
  const _UserTopicProgressQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<UserTopicProgress> query;
  final int? limit;

  @override
  int call({
    Object? globalMastery = ignore,
    Object? topicId = ignore,
    Object? isUnlocked = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (globalMastery != ignore) 1: globalMastery as double?,
      if (topicId != ignore) 3: topicId as int?,
      if (isUnlocked != ignore) 4: isUnlocked as bool?,
    });
  }
}

extension UserTopicProgressQueryUpdate on IsarQuery<UserTopicProgress> {
  _UserTopicProgressQueryUpdate get updateFirst =>
      _UserTopicProgressQueryUpdateImpl(this, limit: 1);

  _UserTopicProgressQueryUpdate get updateAll =>
      _UserTopicProgressQueryUpdateImpl(this);
}

class _UserTopicProgressQueryBuilderUpdateImpl
    implements _UserTopicProgressQueryUpdate {
  const _UserTopicProgressQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<UserTopicProgress, UserTopicProgress, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? globalMastery = ignore,
    Object? topicId = ignore,
    Object? isUnlocked = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (globalMastery != ignore) 1: globalMastery as double?,
        if (topicId != ignore) 3: topicId as int?,
        if (isUnlocked != ignore) 4: isUnlocked as bool?,
      });
    } finally {
      q.close();
    }
  }
}

extension UserTopicProgressQueryBuilderUpdate
    on QueryBuilder<UserTopicProgress, UserTopicProgress, QOperations> {
  _UserTopicProgressQueryUpdate get updateFirst =>
      _UserTopicProgressQueryBuilderUpdateImpl(this, limit: 1);

  _UserTopicProgressQueryUpdate get updateAll =>
      _UserTopicProgressQueryBuilderUpdateImpl(this);
}

extension UserTopicProgressQueryFilter
    on QueryBuilder<UserTopicProgress, UserTopicProgress, QFilterCondition> {
  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  idGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  idGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  idLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 0, value: value));
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  idLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  idBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 0, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  globalMasteryEqualTo(double value, {double epsilon = Filter.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 1, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  globalMasteryGreaterThan(double value, {double epsilon = Filter.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 1, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  globalMasteryGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 1, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  globalMasteryLessThan(double value, {double epsilon = Filter.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 1, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  globalMasteryLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 1, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  globalMasteryBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  currentLocalMasteryHistoryElementEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  currentLocalMasteryHistoryElementGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  currentLocalMasteryHistoryElementGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  currentLocalMasteryHistoryElementLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  currentLocalMasteryHistoryElementLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  currentLocalMasteryHistoryElementBetween(
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

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  currentLocalMasteryHistoryIsEmpty() {
    return not().currentLocalMasteryHistoryIsNotEmpty();
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  currentLocalMasteryHistoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 2, value: null),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicIdGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicIdGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicIdLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 3, value: value));
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicIdLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicIdBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 3, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  isUnlockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 4, value: value),
      );
    });
  }
}

extension UserTopicProgressQueryObject
    on QueryBuilder<UserTopicProgress, UserTopicProgress, QFilterCondition> {}

extension UserTopicProgressQuerySortBy
    on QueryBuilder<UserTopicProgress, UserTopicProgress, QSortBy> {
  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByGlobalMastery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByGlobalMasteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByIsUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }
}

extension UserTopicProgressQuerySortThenBy
    on QueryBuilder<UserTopicProgress, UserTopicProgress, QSortThenBy> {
  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByGlobalMastery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByGlobalMasteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByIsUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }
}

extension UserTopicProgressQueryWhereDistinct
    on QueryBuilder<UserTopicProgress, UserTopicProgress, QDistinct> {
  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterDistinct>
  distinctByGlobalMastery() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterDistinct>
  distinctByCurrentLocalMasteryHistory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterDistinct>
  distinctByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterDistinct>
  distinctByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }
}

extension UserTopicProgressQueryProperty1
    on QueryBuilder<UserTopicProgress, UserTopicProgress, QProperty> {
  QueryBuilder<UserTopicProgress, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserTopicProgress, double, QAfterProperty>
  globalMasteryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserTopicProgress, List<double>, QAfterProperty>
  currentLocalMasteryHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserTopicProgress, int, QAfterProperty> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<UserTopicProgress, bool, QAfterProperty> isUnlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }
}

extension UserTopicProgressQueryProperty2<R>
    on QueryBuilder<UserTopicProgress, R, QAfterProperty> {
  QueryBuilder<UserTopicProgress, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserTopicProgress, (R, double), QAfterProperty>
  globalMasteryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserTopicProgress, (R, List<double>), QAfterProperty>
  currentLocalMasteryHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserTopicProgress, (R, int), QAfterProperty> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<UserTopicProgress, (R, bool), QAfterProperty>
  isUnlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }
}

extension UserTopicProgressQueryProperty3<R1, R2>
    on QueryBuilder<UserTopicProgress, (R1, R2), QAfterProperty> {
  QueryBuilder<UserTopicProgress, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserTopicProgress, (R1, R2, double), QOperations>
  globalMasteryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserTopicProgress, (R1, R2, List<double>), QOperations>
  currentLocalMasteryHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserTopicProgress, (R1, R2, int), QOperations>
  topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<UserTopicProgress, (R1, R2, bool), QOperations>
  isUnlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }
}
