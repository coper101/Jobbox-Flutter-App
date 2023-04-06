import 'package:flutter/material.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/model_data/data.dart';

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
    if (email != Users.user.email || password != Users.user.password) {
      return;
    }
    _loggedInUser = User(
      email: Users.user.email,
      password: Users.user.password,
      firstName: Users.user.firstName,
      lastName: Users.user.lastName,
      mobileNumber: Users.user.mobileNumber,
    );
    notifyListeners();
  }

  void register(
    String email,
    String password,
    String reTypedPassword,
    VoidCallback onDone,
  ) {
    if (email.isEmpty || password.isEmpty || reTypedPassword.isEmpty) {
      return;
    }
    if (password.toLowerCase() != reTypedPassword.toLowerCase()) {
      return;
    }
    _loggedInUser = User(
      email: Users.user.email,
      password: Users.user.password,
      firstName: Users.user.firstName,
      lastName: Users.user.lastName,
      mobileNumber: Users.user.mobileNumber,
    );
    notifyListeners();
    onDone();
  }
}
