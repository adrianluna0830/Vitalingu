import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/register_languages.dart';
import 'package:vitalingu/router/app_router.dart';
import 'package:vitalingu/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await configureDependencies();
  registerLanguages();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
    getIt<NavigationService>().initialize(_appRouter);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'VitaLingu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}

