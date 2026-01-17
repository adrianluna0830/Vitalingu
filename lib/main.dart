import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:vitalingu/app_router.dart';
import 'package:vitalingu/hive/hive_registrar.g.dart';
import 'package:vitalingu/injection.dart';

void main() async {
    await Hive.initFlutter();
  Hive.registerAdapters();
  
  configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: getIt<AppRouter>().config());
  }
}
