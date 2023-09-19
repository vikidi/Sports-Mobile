import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:sportsvillesaarinen/screens/exercises.dart';
import 'package:sportsvillesaarinen/screens/profile.dart';
import 'package:sportsvillesaarinen/screens/routes.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  final Future<void> Function() logoutAction;
  final UserProfile? user;

  HomeScreen(this.logoutAction, this.user, {final Key? key}) : super(key: key);

  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: const ExercisesScreen(),
          icon: Icons.directions_run_outlined,
          title: 'Exercises',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: const RoutesScreen(),
          icon: Icons.route_outlined,
          title: 'Routes',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: ProfileScreen(logoutAction, user),
          icon: Icons.person_outline,
          title: 'Profile',
          navigatorkey: _tab3navigatorKey,
        ),
      ],
    );
  }
}