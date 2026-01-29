import 'package:flutter/material.dart';
import 'package:vitalingu/models/unit_item_view_dto.dart';
import 'package:vitalingu/widgets/unit_item_widget.dart';

class UnitsListWidget extends StatelessWidget {
  final List<UnitItemViewDTO> topics;
  final bool isSelectable;
  final Function(int index) onTopicTap;
  final Function(int index) onLongTap;
  final Function(int index) onStatusTap;

  const UnitsListWidget({
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
        return UnitItemWidget(
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
