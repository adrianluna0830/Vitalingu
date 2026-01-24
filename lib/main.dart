import 'package:flutter/material.dart';
import 'package:signals/signals.dart';
import 'package:vitalingu/app_router.dart';
import 'package:vitalingu/injection.dart';

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
    return MaterialApp.router(routerConfig: getIt<AppRouter>().config());
  }
}
