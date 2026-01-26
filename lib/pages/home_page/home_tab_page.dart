import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/app_router.dart';

@RoutePage()
class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

@override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        HomeRoute(),
        HomeUnitsRoute(),
        HomeWordsRoute(),
        HomeSettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.language,color: Colors.black,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.topic,color: Colors.black,),
              label: 'Units',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book,color: Colors.black,),
              label: 'Words',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,color: Colors.black,),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}