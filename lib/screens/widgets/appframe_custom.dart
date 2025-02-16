
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppFrameWidget extends StatefulWidget {
  const AppFrameWidget(
      {super.key, required this.child});
  final Widget child;

  @override
  State<AppFrameWidget> createState() => _AppFrameWidgetState();
}

List<String> _pages = <String>[
  'bible',
  'reading-plan',
  'community',
  'profile',
];

class _AppFrameWidgetState extends State<AppFrameWidget> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          var name = _pages[index];
          context.goNamed(name);
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.calendar_today)),
            label: 'Bible Plans',
          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.people)),
            label: 'Community',
          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.person)),
            label: 'Profile',
          ),
        ],
      ),
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Bible Mapper'),
          ),

        body: widget.child,

    );
  }
}

