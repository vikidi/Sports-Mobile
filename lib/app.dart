import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportsvillesaarinen/models/app_state.dart';
import 'package:sportsvillesaarinen/models/auth.dart';
import 'package:sportsvillesaarinen/screens/scaffold.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthModel>(create: (context) => AuthModel()),
          ChangeNotifierProxyProvider<AuthModel, AppStateModel>(
              create: (context) => AppStateModel(),
              update: (context, authModel, appState) {
                if (appState == null) throw ArgumentError.notNull('appState');
                appState.authModel = authModel;
                return appState;
              })
        ],
        child: MaterialApp(
          title: 'Sports',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const MyScaffold(),
        ),
    );
  }
}