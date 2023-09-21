import 'package:flutter/foundation.dart';

import '../constants/app_state.dart';
import 'auth.dart';

class AppStateModel extends ChangeNotifier {
  late AuthModel _authModel;
  late AppState _appState = AppState.loading;

  AppState get appState => _appState;

  set authModel(AuthModel authModel) {
    _authModel = authModel;
    _updateAppState();
    notifyListeners();
  }

  void _updateAppState() {
    if(_authModel.isBusy) {
      _appState = AppState.loading;
    }
    else if (_authModel.isLoggedIn) {
      _appState = AppState.authenticated;
    }
    else {
      _appState = AppState.unauthenticated;
    }

    notifyListeners();
  }
}