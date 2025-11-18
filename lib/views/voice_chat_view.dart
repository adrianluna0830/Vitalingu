import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:injectable/injectable.dart';
@injectable
class VoiceChatViewModel  extends ViewModelBase{
  VoiceChatViewModel({required super.navigationService});

  Future<void> goBack() async {
    navigationService.popBack();
  }
}
@RoutePage()
class VoiceChatView extends StatefulWidget {
  const VoiceChatView({super.key});

  @override
  State<VoiceChatView> createState() => _VoiceChatViewState();


}

class _VoiceChatViewState extends State<VoiceChatView> {
  final viewModel =  getIt<VoiceChatViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Chat'),
        
      ),
      body: const Center(
        
      ),
    );
  }
}