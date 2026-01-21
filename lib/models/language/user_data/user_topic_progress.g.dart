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
      IsarPropertySchema(name: 'topicId', type: IsarType.long),
      IsarPropertySchema(name: 'topicMastery', type: IsarType.double),
      IsarPropertySchema(
        name: 'topiclearningStatus',
        type: IsarType.byte,

        enumMap: {"notStarted": 0, "needsPractice": 1, "mastered": 2},
      ),
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
  IsarCore.writeLong(writer, 1, object.topicId);
  IsarCore.writeDouble(writer, 2, object.topicMastery);
  IsarCore.writeByte(writer, 3, object.topiclearningStatus.index);
  return object.id;
}

@isarProtected
UserTopicProgress deserializeUserTopicProgress(IsarReader reader) {
  final int _topicId;
  _topicId = IsarCore.readLong(reader, 1);
  final double _topicMastery;
  _topicMastery = IsarCore.readDouble(reader, 2);
  final TopicLearningStatus _topiclearningStatus;
  {
    if (IsarCore.readNull(reader, 3)) {
      _topiclearningStatus = TopicLearningStatus.notStarted;
    } else {
      _topiclearningStatus =
          _userTopicProgressTopiclearningStatus[IsarCore.readByte(reader, 3)] ??
          TopicLearningStatus.notStarted;
    }
  }
  final object = UserTopicProgress(
    topicId: _topicId,
    topicMastery: _topicMastery,
    topiclearningStatus: _topiclearningStatus,
  );
  object.id = IsarCore.readId(reader);
  return object;
}

@isarProtected
dynamic deserializeUserTopicProgressProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readLong(reader, 1);
    case 2:
      return IsarCore.readDouble(reader, 2);
    case 3:
      {
        if (IsarCore.readNull(reader, 3)) {
          return TopicLearningStatus.notStarted;
        } else {
          return _userTopicProgressTopiclearningStatus[IsarCore.readByte(
                reader,
                3,
              )] ??
              TopicLearningStatus.notStarted;
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _UserTopicProgressUpdate {
  bool call({
    required int id,
    int? topicId,
    double? topicMastery,
    TopicLearningStatus? topiclearningStatus,
  });
}

class _UserTopicProgressUpdateImpl implements _UserTopicProgressUpdate {
  const _UserTopicProgressUpdateImpl(this.collection);

  final IsarCollection<int, UserTopicProgress> collection;

  @override
  bool call({
    required int id,
    Object? topicId = ignore,
    Object? topicMastery = ignore,
    Object? topiclearningStatus = ignore,
  }) {
    return collection.updateProperties(
          [id],
          {
            if (topicId != ignore) 1: topicId as int?,
            if (topicMastery != ignore) 2: topicMastery as double?,
            if (topiclearningStatus != ignore)
              3: topiclearningStatus as TopicLearningStatus?,
          },
        ) >
        0;
  }
}

sealed class _UserTopicProgressUpdateAll {
  int call({
    required List<int> id,
    int? topicId,
    double? topicMastery,
    TopicLearningStatus? topiclearningStatus,
  });
}

class _UserTopicProgressUpdateAllImpl implements _UserTopicProgressUpdateAll {
  const _UserTopicProgressUpdateAllImpl(this.collection);

  final IsarCollection<int, UserTopicProgress> collection;

  @override
  int call({
    required List<int> id,
    Object? topicId = ignore,
    Object? topicMastery = ignore,
    Object? topiclearningStatus = ignore,
  }) {
    return collection.updateProperties(id, {
      if (topicId != ignore) 1: topicId as int?,
      if (topicMastery != ignore) 2: topicMastery as double?,
      if (topiclearningStatus != ignore)
        3: topiclearningStatus as TopicLearningStatus?,
    });
  }
}

extension UserTopicProgressUpdate on IsarCollection<int, UserTopicProgress> {
  _UserTopicProgressUpdate get update => _UserTopicProgressUpdateImpl(this);

  _UserTopicProgressUpdateAll get updateAll =>
      _UserTopicProgressUpdateAllImpl(this);
}

sealed class _UserTopicProgressQueryUpdate {
  int call({
    int? topicId,
    double? topicMastery,
    TopicLearningStatus? topiclearningStatus,
  });
}

class _UserTopicProgressQueryUpdateImpl
    implements _UserTopicProgressQueryUpdate {
  const _UserTopicProgressQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<UserTopicProgress> query;
  final int? limit;

  @override
  int call({
    Object? topicId = ignore,
    Object? topicMastery = ignore,
    Object? topiclearningStatus = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (topicId != ignore) 1: topicId as int?,
      if (topicMastery != ignore) 2: topicMastery as double?,
      if (topiclearningStatus != ignore)
        3: topiclearningStatus as TopicLearningStatus?,
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
    Object? topicId = ignore,
    Object? topicMastery = ignore,
    Object? topiclearningStatus = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (topicId != ignore) 1: topicId as int?,
        if (topicMastery != ignore) 2: topicMastery as double?,
        if (topiclearningStatus != ignore)
          3: topiclearningStatus as TopicLearningStatus?,
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

const _userTopicProgressTopiclearningStatus = {
  0: TopicLearningStatus.notStarted,
  1: TopicLearningStatus.needsPractice,
  2: TopicLearningStatus.mastered,
};

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
  topicIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicIdGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicIdGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicIdLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 1, value: value));
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicIdLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 1, value: value),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicIdBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 1, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicMasteryEqualTo(double value, {double epsilon = Filter.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicMasteryGreaterThan(double value, {double epsilon = Filter.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicMasteryGreaterThanOrEqualTo(
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
  topicMasteryLessThan(double value, {double epsilon = Filter.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 2, value: value, epsilon: epsilon),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topicMasteryLessThanOrEqualTo(
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
  topicMasteryBetween(
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
  topiclearningStatusEqualTo(TopicLearningStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 3, value: value.index),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topiclearningStatusGreaterThan(TopicLearningStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 3, value: value.index),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topiclearningStatusGreaterThanOrEqualTo(TopicLearningStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 3, value: value.index),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topiclearningStatusLessThan(TopicLearningStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 3, value: value.index),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topiclearningStatusLessThanOrEqualTo(TopicLearningStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 3, value: value.index),
      );
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterFilterCondition>
  topiclearningStatusBetween(
    TopicLearningStatus lower,
    TopicLearningStatus upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 3, lower: lower.index, upper: upper.index),
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
  sortByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByTopicMastery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByTopicMasteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByTopiclearningStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  sortByTopiclearningStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
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
  thenByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByTopicMastery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByTopicMasteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByTopiclearningStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterSortBy>
  thenByTopiclearningStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }
}

extension UserTopicProgressQueryWhereDistinct
    on QueryBuilder<UserTopicProgress, UserTopicProgress, QDistinct> {
  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterDistinct>
  distinctByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterDistinct>
  distinctByTopicMastery() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<UserTopicProgress, UserTopicProgress, QAfterDistinct>
  distinctByTopiclearningStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
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

  QueryBuilder<UserTopicProgress, int, QAfterProperty> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserTopicProgress, double, QAfterProperty>
  topicMasteryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserTopicProgress, TopicLearningStatus, QAfterProperty>
  topiclearningStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
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

  QueryBuilder<UserTopicProgress, (R, int), QAfterProperty> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserTopicProgress, (R, double), QAfterProperty>
  topicMasteryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserTopicProgress, (R, TopicLearningStatus), QAfterProperty>
  topiclearningStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
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

  QueryBuilder<UserTopicProgress, (R1, R2, int), QOperations>
  topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserTopicProgress, (R1, R2, double), QOperations>
  topicMasteryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<UserTopicProgress, (R1, R2, TopicLearningStatus), QOperations>
  topiclearningStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}
