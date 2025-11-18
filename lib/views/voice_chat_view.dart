import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/widgets/voice_recorder_button.dart';
@injectable
class VoiceChatViewModel extends ViewModelBase {
  VoiceChatViewModel({required super.navigationService});

  final isCircle = signal(true);

  void toggleShape() {
    isCircle.value = !isCircle.value;
  }

  Future<void> goBack() async {
    navigationService.popBack();
  }

  @override
  void dispose() {
    isCircle.dispose();
  }
}@RoutePage()
class VoiceChatView extends StatefulWidget {
  const VoiceChatView({super.key});

  @override
  State<VoiceChatView> createState() => _VoiceChatViewState();
}

class _VoiceChatViewState extends State<VoiceChatView> {
  final viewModel = getIt<VoiceChatViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Chat'),
      ),
      body: Center(
        child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Watch((context) => VoiceRecorderButton(
                isCircle: viewModel.isCircle.value,
                onTap: viewModel.toggleShape,
              )),
        ),
      ),
    );
  }
}