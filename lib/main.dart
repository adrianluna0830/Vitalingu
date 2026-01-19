import 'package:flutter/material.dart';
import 'package:vitalingu/app_router.dart';
import 'package:vitalingu/injection.dart';

void main() async {
  await configureDependencies();
  // await getIt<LoadLanguageTopicsService>().tryLoadTopics();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: getIt<AppRouter>().config());
  }
}
