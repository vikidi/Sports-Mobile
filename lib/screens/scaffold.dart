import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportsvillesaarinen/screens/home.dart';
import 'package:sportsvillesaarinen/screens/landing.dart';

import '../constants/app_state.dart';
import '../models/app_state.dart';

const appScheme = 'sportsvillesaarinen';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, state, child) {
        return Scaffold(
          body: Center(
            child: state.appState == AppState.loading
              ? const CircularProgressIndicator()
              : state.appState == AppState.authenticated
              ? HomeScreen()
              : const LandingScreen(),
          ),
        );
      }
    );
  }
}