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
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon:  const Icon(Icons.home),
            icon:  const Icon(Icons.home_outlined),
            label: AppLocalizations.of(context)!.homeNav,
          ),
          NavigationDestination(
            icon:  const Badge(child: Icon(Icons.calendar_today)),
            label: AppLocalizations.of(context)!.biblePlansNav,
          ),
           NavigationDestination(
            icon:  Badge(label: Text('2'), child: Icon(Icons.people)),
            label: AppLocalizations.of(context)!.communityNav,
          ),
           NavigationDestination(
            icon:  Badge(label: Text('2'), child: Icon(Icons.person)),
            label: AppLocalizations.of(context)!.profileNav,
          ),
        ],
      ),
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(AppLocalizations.of(context)!.appTitle),
      ),

        body: widget.child,

    );
  }
}

