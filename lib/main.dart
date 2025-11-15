import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(); // Ensure dependencies are configured

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<NavigationService>().router.config(),
      title: 'VitaLingu',
      debugShowCheckedModeBanner: false,
    );
  }
}

