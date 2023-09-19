import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  final Future<void> Function() loginAction;
  final String loginError;

  const LandingScreen(this.loginAction, this.loginError, {final Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () async {
            await loginAction();
          },
          child: const Text('Login'),
        ),
        Text(loginError),
      ],
    );
  }
}