import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universalapp/initial_services.dart';
import 'package:universalapp/modules/biblereading/bloc/bible_bloc.dart';
import 'package:universalapp/modules/biblereading/repository/bible_repository.dart';
import 'router/router_config.dart';

void main() async {
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
              create: (_) => BibleBloc(
                BibleRepository()
              )
          ),
        ],
      child: const MainApp(
      ),
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
      /*
      try {
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
        _setupInteractedMessage(context);
      } catch (e) {
        LoggingManager().logDebug('$e');
      }

       */
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Bible Mapper",
      routerConfig: goRouter,
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
