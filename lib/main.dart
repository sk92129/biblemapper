import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:universalapp/initial_services.dart';
import 'package:universalapp/modules/biblereading/bloc/bible_bloc.dart';
import 'package:universalapp/modules/biblereading/repository/bible_repository.dart';
import 'router/router_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';

// Change the navigatorKey to be a router key
final _rootNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  runApp(const GlobalManager());
}

class GlobalManager extends StatelessWidget {
  const GlobalManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BibleBloc>(
          create: (_) => BibleBloc(BibleRepository()),
        ),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //RemoteMessage? currentMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Bible Mapper",
      routerConfig: GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: '/bible',  // Add initial location
        routes: [
          // Copy routes from router_config.dart
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
          ),
          GoRoute(
            path: '/community',
            name: 'community',
            builder: (context, state) => const CommunityScreen(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      
      // Add test-friendly semantic labels
      shortcuts: {
        ...WidgetsApp.defaultShortcuts,
        if (kDebugMode) 
          const SingleActivator(LogicalKeyboardKey.escape): 
              VoidCallbackIntent(() => _rootNavigatorKey.currentState?.pop()),
      },
      
      // Add accessibility features
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ).copyWith(
          // Ensure sufficient color contrast (WCAG 2.1 compliant)
          primary: Colors.blue.shade700,
          secondary: Colors.teal.shade700,
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
          bodyLarge: const TextStyle(fontSize: 16.0),
          bodyMedium: const TextStyle(fontSize: 14.0),
          titleMedium: const TextStyle(fontSize: 16.0),
        ),
      ),
      
      // Enable text scaling for accessibility
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(1.0, 2.0),
          ),
          child: Semantics(
            container: true,
            label: 'Bible Mapper Application',
            child: child!,
          ),
        );
      },
      
      // Add semantics configuration
      showSemanticsDebugger: false, // Set to true during development to visualize semantics
      checkerboardRasterCacheImages: false,
      checkerboardOffscreenLayers: false,
      
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
        Locale('zh'), // Chinese
        Locale('ko'), // Korean
        Locale('de'), // German
      ],
    );
  }
}

/*

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bible Mapper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}

 */
