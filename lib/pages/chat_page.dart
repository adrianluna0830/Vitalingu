import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/ai_client.dart';
import 'package:vitalingu/models/language/learning_unit.dart';
import 'package:vitalingu/models/user_app_settings.dart';


@injectable
class ChatViewModel {
  final AiClient aiClient;
  final NativeLanguageSignal nativeLanguageSignal;
  final TargetLanguageSignal targetLanguageSignal;

  ChatViewModel(this.aiClient, this.nativeLanguageSignal, this.targetLanguageSignal);

  String getUnitTitle(LearningUnit learningUnit) {
    return learningUnit.translations[targetLanguageSignal.value]!;
  }
}


@RoutePage()
class ChatPage extends StatefulWidget {
  final LearningUnit learningUnit;
  const ChatPage({super.key, required this.learningUnit});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final vm = getIt<ChatViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 192, 192, 192).withOpacity(0.57), 
        title: Text(vm.getUnitTitle(widget.learningUnit)),
      ),
      body: Center(
        child: Text('Chat interface goes here'),
      ),
    );
  }
}