import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
@injectable
class LanguageViewModel extends ViewModelBase
{
  LanguageViewModel({required super.navigationService});

  Future<void> goToVoiceChatView() async
  {
    await navigationService.goToVoiceChatView();
  }
  
}
@RoutePage()
class LanguageView extends StatelessWidget {
   LanguageView({super.key});
  final viewModel = getIt<LanguageViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: ElevatedButton(onPressed: () async => await viewModel.goToVoiceChatView(), child: const Text('Go to Voice Chat'))),
      ),
    );
  }
}