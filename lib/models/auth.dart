import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

const appScheme = 'sportsvillesaarinen';

class AuthModel extends ChangeNotifier {
  bool _isBusy = false;

  Credentials? _credentials;
  final Auth0 _auth0 = Auth0('villesaarinen-dev.eu.auth0.com', 'ogsickdpqWu7z0ZhH0kEbuELtswkuJN2');

  AuthModel() {
    init();
  }

  Future<void> init() async {
    _isBusy = true;
    notifyListeners();

    bool hasCredentials = await _auth0.credentialsManager.hasValidCredentials();
    if (hasCredentials) {
      _credentials = await _auth0.credentialsManager.credentials();
    }

    _isBusy = false;
    notifyListeners();
  }

  bool get isBusy => _isBusy;
  bool get isLoggedIn => _credentials != null;

  Future<void> loginAction() async {
    _isBusy = true;
    notifyListeners();

    try {
      final Credentials credentials = await _auth0.webAuthentication(scheme: appScheme).login();
      _credentials = credentials;
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');
      _credentials = null;
    }

    _isBusy = false;
    notifyListeners();
  }

  Future<void> logoutAction() async {
    await _auth0.webAuthentication(scheme: appScheme).logout();
    _credentials = null;
    notifyListeners();
  }
}