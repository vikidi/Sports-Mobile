import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            Provider.of<AuthModel>(context, listen: false).loginAction();
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}