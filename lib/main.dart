import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:vitalingu/hive/hive_registrar.g.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Hive.initFlutter();
    Hive.registerAdapters();
    await configureDependencies();
    runApp(const MyApp());
  } catch (e) {
    rethrow;
  }
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

