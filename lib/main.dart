import 'package:flutter/material.dart';
import 'package:signals/signals.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/router/app_router.dart';
import 'package:vitalingu/core/widgets/error_displayer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  SignalsObserver.instance = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<AppRouter>().config(),
      builder: (context, child) => ErrorDisplayer(child: child!),
    );
  }
}
