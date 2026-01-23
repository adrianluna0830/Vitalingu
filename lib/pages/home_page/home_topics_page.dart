import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/language/topic_learning_status_enum.dart';
import 'package:vitalingu/view_models/home_topics_view_model.dart';

@RoutePage()
class HomeTopicsPage extends StatefulWidget {
  const HomeTopicsPage({super.key});

  @override
  State<HomeTopicsPage> createState() => _HomeTopicsPageState();
}

class _HomeTopicsPageState extends State<HomeTopicsPage> {
  final HomeTopicsViewModel viewModel = getIt<HomeTopicsViewModel>();
  late Future<List<GrammarTopic>> _topicsFuture;

  @override
  void initState() {
    super.initState();
    _topicsFuture = viewModel.getTopics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Topics')),
      body: FutureBuilder<List<GrammarTopic>>(
        future: _topicsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final topics = snapshot.data ?? [];

          if (topics.isEmpty) {
            return const Center(child: Text('No topics found.'));
          }

          return ListView.builder(
            reverse: true,
            itemCount: topics.length,
            itemBuilder: (context, index) {
              final topic = topics[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: TopicCard(
                  title: topic.topicTitle.toString(),
                  cefrLevel: topic.cefrLevel,
                  status: TopicLearningStatus.learning,
                  language: Language.Spanish,
                  isEnabled: true,
                  onLock: () {
                    debugPrint('Visibility ON ${topic.topicTitle}');
                  },
                  onUnlock: () {
                    debugPrint('Visibility OFF ${topic.topicTitle}');
                  },
                  onEditStatus: (currentStatus) {
                    debugPrint(
                      'Edit status pressed. Current status: $currentStatus',
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  final String title;
  final CEFR cefrLevel;
  final TopicLearningStatus status;
  final Language language;
  final bool isEnabled;
  final VoidCallback onLock;
  final VoidCallback onUnlock;

  final void Function(TopicLearningStatus status) onEditStatus;

  const TopicCard({
    super.key,
    required this.title,
    required this.cefrLevel,
    required this.status,
    required this.language,
    required this.isEnabled,
    required this.onLock,
    required this.onUnlock,
    required this.onEditStatus,
  });

  Color _cefrColor(CEFR level) {
    switch (level) {
      case CEFR.A1:
        return Colors.lightGreen;
      case CEFR.A2:
        return const Color.fromARGB(255, 111, 161, 54);
      case CEFR.B1:
        return Colors.blue;
      case CEFR.B2:
        return Colors.indigo;
      case CEFR.C1:
        return Colors.orange;
      case CEFR.C2:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 12),
            child: Text(
              cefrLevel.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _cefrColor(cefrLevel),
                fontSize: 20,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        status.description(language),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () => onEditStatus(status),
                        child: const Icon(
                          Icons.edit,
                          size: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          IconButton(
            icon: Icon(
              isEnabled ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: isEnabled ? onLock : onUnlock,
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
