import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/features/startup/presentation/view_model/app_startup_loading_view_model.dart';

@RoutePage()
class AppStartupLoadingView extends StatefulWidget {
  const AppStartupLoadingView({super.key});

  @override
  State<AppStartupLoadingView> createState() => _AppStartupLoadingViewState();
}

class _AppStartupLoadingViewState extends State<AppStartupLoadingView> {
  late final AppStartupLoadingViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<AppStartupLoadingViewModel>();
    viewModel.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
