import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/topic_learning_status_enum.dart';
import 'package:vitalingu/models/topic_item_view_dto.dart';
import 'package:vitalingu/view_models/home_topics_view_model.dart';
import 'package:vitalingu/widgets/select_level_dialog.dart';
import 'package:vitalingu/widgets/select_status_dialog.dart';
import 'package:vitalingu/widgets/topics_list_widget.dart';

@RoutePage()
class HomeTopicsPage extends StatefulWidget {
  const HomeTopicsPage({super.key});

  @override
  State<HomeTopicsPage> createState() => _HomeTopicsPageState();
}

class _HomeTopicsPageState extends State<HomeTopicsPage> {
  final vm = getIt<HomeTopicsViewModel>();

  @override
  Widget build(BuildContext context) {
    final topics = vm.convertedTopics.watch(context);
    final isSelectable = vm.isSelectable.watch(context);

    return Scaffold(
      appBar: _buildAppBar(context, isSelectable),
      body: _buildBody(topics, isSelectable),
    );
  }

  AppBar _buildAppBar(BuildContext context, bool isSelectable) {
    return AppBar(
      title: const Text('Home Topics'),
      actions: [
        if (isSelectable)
          _EditStatusButton(
            onStatusSelected: vm.updateStatusForSelectedTopics,
            nativeLanguage: vm.nativeLanguageSignal.value,
          ),
        if (!isSelectable)
          _ChangeLevelButton(
            onLevelSelected: vm.updateTopicStatusWithCEFR,
          ),
      ],
    );
  }

  Widget _buildBody(List<TopicItemViewDTO> topics, bool isSelectable) {
    return TopicsListWidget(
      topics: topics,
      isSelectable: isSelectable,
      onTopicTap: vm.onTopicTap,
      onLongTap: vm.onToggleSelect,
      onStatusTap: vm.updateStatus,
    );
  }
}

class _EditStatusButton extends StatelessWidget {
  final Function(TopicLearningStatus) onStatusSelected;
  final dynamic nativeLanguage;

  const _EditStatusButton({
    required this.onStatusSelected,
    required this.nativeLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () => _handlePress(context),
    );
  }

  Future<void> _handlePress(BuildContext context) async {
    final selectedStatus = await showDialog<TopicLearningStatus>(
      context: context,
      builder: (context) => SelectStatusDialog(
        statuses: TopicLearningStatus.values,
        nativeLanguage: nativeLanguage,
      ),
    );

    if (selectedStatus != null) {
      onStatusSelected(selectedStatus);
    }
  }
}

class _ChangeLevelButton extends StatelessWidget {
  final Function(CEFR) onLevelSelected;

  const _ChangeLevelButton({
    required this.onLevelSelected,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.change_circle),
      onPressed: () => _handlePress(context),
    );
  }

  Future<void> _handlePress(BuildContext context) async {
    final selectedLevel = await showDialog<CEFR>(
      context: context,
      builder: (context) => const SelectLevelDialog(),
    );

    if (selectedLevel != null) {
      onLevelSelected(selectedLevel);
    }
  }
}