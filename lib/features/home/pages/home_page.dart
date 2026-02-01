import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/router/app_router.dart';

@injectable
class HomePageViewmodel
{
  final AppRouter _appRouter;

  HomePageViewmodel(this._appRouter);

  void navigateToPracticePage()
  {
    _appRouter.push(ChatRoute());
  }
}
@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final vm = getIt<HomePageViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ElevatedButton(onPressed: vm.navigateToPracticePage, child: Text("Practice"))
    );
  }
}
