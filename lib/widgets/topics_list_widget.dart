import 'package:flutter/material.dart';
import 'package:vitalingu/models/topic_item_view_dto.dart';
import 'package:vitalingu/view_models/home_topics_view_model.dart';
import 'package:vitalingu/widgets/topic_item_widget.dart';

class TopicsListWidget extends StatelessWidget {
  final List<TopicItemViewDTO> topics;
  final bool isSelectable;
  final Function(int index) onTopicTap;
  final Function(int index) onLongTap;
  final Function(int index) onStatusTap;

  const TopicsListWidget({
    super.key,
    required this.topics,
    required this.isSelectable,
    required this.onTopicTap,
    required this.onLongTap,
    required this.onStatusTap,
  });

  @override
  Widget build(BuildContext context) {
    if (topics.isEmpty) {
      return const Center(child: Text('No topics available'));
    }
    return ListView.builder(
      reverse: true,
      itemCount: topics.length,
      itemBuilder: (context, index) {
        final topic = topics[index];
        return TopicItemWidget(
          isCompleted: topic.isCompleted,
          isSelectable: isSelectable,
          title: topic.title,
          level: topic.level,
          status: topic.status,
          onTopicTap: () {
            onTopicTap(index);
          },
          isSelected: topic.isSelected,
          levelColor: topic.color,
          onLongTap: () {
            onLongTap(index);
          }, onStatusTap: () { 
            onStatusTap(index);
           },
        );
      },
    );
  }
}
