enum TopicLearningStatus {
  JustStarted,          
  PartiallyUnderstood,  
  UnderstoodNeedsPractice,
  Mastered          
}

extension TopicLearningStatusExtension on TopicLearningStatus {
  String get description {
    switch (this) {
      case TopicLearningStatus.JustStarted:
        return 'The user has just started exploring or learning the topic.';
      case TopicLearningStatus.PartiallyUnderstood:
        return 'The user is beginning to understand the topic but still has doubts.';
      case TopicLearningStatus.UnderstoodNeedsPractice:
        return 'The user understands the topic but needs more practice to consolidate.';
      case TopicLearningStatus.Mastered:
        return 'The user has fully mastered the topic and can use it confidently.';
    }
  }
}