import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/models/language/cefr_enum.dart';
import 'package:vitalingu/core/models/language/unit_learning_status_enum.dart';
import 'package:vitalingu/core/widgets/select_level_dialog.dart';
import 'package:vitalingu/core/widgets/select_status_dialog.dart';
import 'package:vitalingu/features/home/view_models/home_units_view_model.dart';
import 'package:vitalingu/features/learning/models/unit_item_view_dto.dart';
import 'package:vitalingu/features/learning/widgets/units_list_widget.dart';

@RoutePage()
class HomeUnitsPage extends StatefulWidget {
  const HomeUnitsPage({super.key});

  @override
  State<HomeUnitsPage> createState() => _HomeUnitsPageState();
}

class _HomeUnitsPageState extends State<HomeUnitsPage> {
  final vm = getIt<HomeUnitsViewModel>();

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
            notStartedText: vm.statusNotStartedText.watch(context),
            learningText: vm.statusLearningText.watch(context),
            reviewingText: vm.statusReviewingText.watch(context),
            masteredText: vm.statusMasteredText.watch(context),
            onNotStarted: () =>
                vm.updateStatusForSelectedTopics(UnitLearningStatus.notStarted),
            onLearning: () =>
                vm.updateStatusForSelectedTopics(UnitLearningStatus.learning),
            onReviewing: () =>
                vm.updateStatusForSelectedTopics(UnitLearningStatus.reviewing),
            onMastered: () =>
                vm.updateStatusForSelectedTopics(UnitLearningStatus.mastered),
          ),
        if (!isSelectable)
          _ChangeLevelButton(
            onA1: () => vm.updateTopicStatusWithCEFR(CEFR.A1),
            onA2: () => vm.updateTopicStatusWithCEFR(CEFR.A2),
            onB1: () => vm.updateTopicStatusWithCEFR(CEFR.B1),
            onB2: () => vm.updateTopicStatusWithCEFR(CEFR.B2),
          ),
      ],
    );
  }

  Widget _buildBody(List<UnitItemViewDTO> topics, bool isSelectable) {
    return UnitsListWidget(
      topics: topics,
      isSelectable: isSelectable,
      onTopicTap: vm.onTopicTap,
      onLongTap: vm.onToggleSelect,
      onStatusTap: vm.updateStatus,
    );
  }
}

class _EditStatusButton extends StatelessWidget {
  final String notStartedText;
  final String learningText;
  final String reviewingText;
  final String masteredText;
  final VoidCallback onNotStarted;
  final VoidCallback onLearning;
  final VoidCallback onReviewing;
  final VoidCallback onMastered;

  const _EditStatusButton({
    required this.notStartedText,
    required this.learningText,
    required this.reviewingText,
    required this.masteredText,
    required this.onNotStarted,
    required this.onLearning,
    required this.onReviewing,
    required this.onMastered,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () => _handlePress(context),
    );
  }

  Future<void> _handlePress(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => SelectStatusDialog(
        notStartedText: notStartedText,
        learningText: learningText,
        reviewingText: reviewingText,
        masteredText: masteredText,
        onNotStarted: () {
          onNotStarted();
          Navigator.pop(context);
        },
        onLearning: () {
          onLearning();
          Navigator.pop(context);
        },
        onReviewing: () {
          onReviewing();
          Navigator.pop(context);
        },
        onMastered: () {
          onMastered();
          Navigator.pop(context);
        },
      ),
    );
  }
}

class _ChangeLevelButton extends StatelessWidget {
  final VoidCallback onA1;
  final VoidCallback onA2;
  final VoidCallback onB1;
  final VoidCallback onB2;

  const _ChangeLevelButton({
    required this.onA1,
    required this.onA2,
    required this.onB1,
    required this.onB2,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.change_circle),
      onPressed: () => _handlePress(context),
    );
  }

  Future<void> _handlePress(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => SelectLevelDialog(
        onA1: () {
          onA1();
          Navigator.pop(context);
        },
        onA2: () {
          onA2();
          Navigator.pop(context);
        },
        onB1: () {
          onB1();
          Navigator.pop(context);
        },
        onB2: () {
          onB2();
          Navigator.pop(context);
        },
      ),
    );
  }
}
