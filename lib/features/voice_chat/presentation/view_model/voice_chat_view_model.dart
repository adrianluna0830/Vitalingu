// viewmodels/voice_chat_view_model.dart

import 'package:injectable/injectable.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/base/view_model_base.dart';

@injectable
class VoiceChatViewModel extends ViewModelBase {
  VoiceChatViewModel({required super.navigationService});

  final isCircle = signal(true);

  final showInfoPanel = signal(false);

  void toggleShape() {
    isCircle.value = !isCircle.value;
  }

  void openInfoPanel() {
    showInfoPanel.value = true;
  }

  void closeInfoPanel() {
    showInfoPanel.value = false;
  }

  Future<void> goBack() async {
    navigationService.popBack();
  }

  @override
  void dispose() {
    isCircle.dispose();
    showInfoPanel.dispose();
  }
}
