import 'package:flutter/material.dart';

import '../../model/User.dart';

class UserModelData with ChangeNotifier {
  // -- States --
  User? _loggedInUser;

  bool get isLoggedIn {
    return _loggedInUser != null;
  }

  String get greeting {
    return 'Hi ${_loggedInUser?.firstName ?? ''} 👋🏻';
  }

  // -- Events --
  void login(String email, String password) {
    if (email != 'example@mail.com' || password != 'example') {
      return;
    }
    _loggedInUser = User(
      email: email,
      password: password,
      firstName: 'Adrian',
      lastName: 'Severin',
      mobileNumber: '6594717281',
    );
    notifyListeners();
  }

  void register(String email, String password, String reTypedPassword) {
    if (email.isEmpty || password.isEmpty || reTypedPassword.isEmpty) {
      return;
    }
    if (password == reTypedPassword) {
      return;
    }
    _loggedInUser = User(
      email: email,
      password: password,
      firstName: 'Adrian',
      lastName: 'Severin',
      mobileNumber: '6594717281',
    );
    notifyListeners();
  }
}
