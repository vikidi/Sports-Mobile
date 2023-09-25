import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportsvillesaarinen/models/app_state.dart';
import 'package:sportsvillesaarinen/models/auth.dart';
import 'package:sportsvillesaarinen/screens/scaffold.dart';

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, this.savedThemeMode});

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
        child: AdaptiveTheme(
          light: ThemeData.light(useMaterial3: false),
          dark: ThemeData.dark(useMaterial3: false),
          initial: savedThemeMode ?? AdaptiveThemeMode.light,
          debugShowFloatingThemeButton: true,
          builder: (theme, darkTheme) => MaterialApp(
            title: 'Sports',
            theme: theme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: const MyScaffold(),
          ),
        ),
    );
  }
}