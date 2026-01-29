import 'package:vitalingu/models/language/unit_learning_status_enum.dart';

class UserUnitData {
  int? id;
  String unitCode;
  double topicMastery;
  UnitLearningStatus topicLearningStatus;

  UserUnitData({
    this.id,
    required this.unitCode,
    this.topicMastery = 0.0,
    this.topicLearningStatus = UnitLearningStatus.notStarted,
  });

  Map<String, dynamic> toJson() {
    return {
      'unitCode': unitCode,
      'topicMastery': topicMastery,
      'topicLearningStatus': topicLearningStatus.name,
    };
  }

  factory UserUnitData.fromJson(Map<String, dynamic> json, int id) {
    return UserUnitData(
      id: id,
      unitCode: json['unitCode'],
      topicMastery: json['topicMastery'],
      topicLearningStatus:
          UnitLearningStatus.values.byName(json['topicLearningStatus']),
    );
  }

  UserUnitData copyWith({
    int? id,
    String? unitCode,
    double? topicMastery,
    UnitLearningStatus? topicLearningStatus,
  }) {
    return UserUnitData(
      id: id ?? this.id,
      unitCode: unitCode ?? this.unitCode,
      topicMastery: topicMastery ?? this.topicMastery,
      topicLearningStatus: topicLearningStatus ?? this.topicLearningStatus,
    );
  }
}
