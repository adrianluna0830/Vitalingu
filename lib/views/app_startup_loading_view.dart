import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/viewmodels/app_startup_loading_view_model.dart';
@RoutePage()
class AppStartupLoadingView extends StatefulWidget {
  const AppStartupLoadingView({super.key});

  @override
  State<AppStartupLoadingView> createState() => _AppStartupLoadingViewState();
}

class _AppStartupLoadingViewState extends State<AppStartupLoadingView> {
  AppStartupLoadingViewModel viewModel  = getIt<AppStartupLoadingViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.initializeApp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}