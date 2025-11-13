import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:vitalingu/hive/hive_registrar.g.dart'; // Generado automáticamente
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive
    ..init('.') 
    ..registerAdapters();

  await configureDependencies();
  
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

