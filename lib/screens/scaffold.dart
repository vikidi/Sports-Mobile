import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:sportsvillesaarinen/screens/home.dart';
import 'package:sportsvillesaarinen/screens/landing.dart';

const appScheme = 'sportsvillesaarinen';

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  bool isBusy = false;
  late String errorMessage;

  Credentials? _credentials;
  late Auth0 auth0;

  @override
  void initState() {
    super.initState();

    auth0 = Auth0('villesaarinen-dev.eu.auth0.com', 'ogsickdpqWu7z0ZhH0kEbuELtswkuJN2');
    errorMessage = '';
  }

  Future<void> loginAction() async {
    setState(() {
      isBusy = true;
      errorMessage = '';
    });

    try {
      final Credentials credentials = await auth0.webAuthentication(scheme: appScheme).login();

      setState(() {
        isBusy = false;
        _credentials = credentials;
      });
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');

      setState(() {
        isBusy = false;
        errorMessage = e.toString();
      });
    }
  }

  Future<void> logoutAction() async {
    await auth0.webAuthentication(scheme: appScheme).logout();

    setState(() {
      _credentials = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: isBusy
              ? const CircularProgressIndicator()
              : _credentials != null
              ? HomeScreen(logoutAction, _credentials?.user)
              : LandingScreen(loginAction, errorMessage),
        ),
      ),
    );
  }
}