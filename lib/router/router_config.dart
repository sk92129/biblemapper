import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universalapp/modules/biblereading/ui/bible_reading.dart';
import 'package:universalapp/modules/community/ui/community_screen.dart';
import 'package:universalapp/modules/profile/ui/profile_screen.dart';
import 'package:universalapp/modules/readingplans/ui/reading_plan_screen.dart';
import 'package:universalapp/modules/dashboard/main_screen.dart';


final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/bible',
  routes: [
    GoRoute(
      path: '/bible',
      name: 'bible',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
          path: 'reading',
          builder: (context, state) => const BibleReadingScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/reading-plan',
      name: 'reading-plan',
      builder: (context, state) => const ReadingPlanScreen(),
      routes: [
      ],
    ),

    GoRoute(
      path: '/community',
      name: 'community',
      builder: (context, state) => const CommunityScreen(),
      routes: [
      ],
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
      routes: [
      ],
    ),

/*
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/bible',
              builder: (context, state) => const MainScreen(),
              routes: [
                GoRoute(
                  path: 'reading',
                  builder: (context, state) => const BibleReadingScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/reading-plan',
              builder: (context, state) => const ReadingPlanScreen(),
            ),
          ],
        ),

        StatefulShellBranch( // Add new branch for CommunityScreen
          routes: [
            GoRoute(
              path: '/community',
              builder: (context, state) => const CommunityScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),


      ],
    ),
*/


  ],
);

/*
class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bible Mapper'),
      ),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bible',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Reading Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Community',
          ),
          // BottomNavigationBarItem( // Add new BottomNavigationBarItem for Community
          //   icon: Icon(Icons.people),
          //   label: 'Community',
          // ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
      ),
    );
  }
}

 */