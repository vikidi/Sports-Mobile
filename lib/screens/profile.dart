import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class ProfileScreen extends StatelessWidget {
  final Future<void> Function() logoutAction;
  final UserProfile? user;

  const ProfileScreen(this.logoutAction, this.user, {final Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 4),
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(user?.pictureUrl.toString() ?? ''),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('Name: ${user?.name}'),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: () async {
            await logoutAction();
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}