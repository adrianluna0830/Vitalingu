import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/view_models/startup_view_model.dart';

@RoutePage()
class StartupIntroductionPage extends StatelessWidget {
  const StartupIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to Vitalingu!'),
          SizedBox(height: 16),
          TextButton(
            onPressed: () 
            {
              getIt<StartupViewModel>().next(context.tabsRouter);
            },

            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
