import 'package:flutter/material.dart';

import '../model/job.dart';
import '../../model/User.dart';

import '../model_data/data.dart';

class UserModelData with ChangeNotifier {
  // -- States --
  User? _loggedInUser;
  final List<Job> _appliedJobs = [];

  // -- UI --
  bool get isLoggedIn {
    return _loggedInUser != null;
  }

  List<Job> get appliedJobs {
    return [..._appliedJobs];
  }

  String get greeting {
    return 'Hi ${_loggedInUser?.firstName ?? ''} 👋🏻';
  }

  UserModelData() {
    applyJob(Jobs.jobs.first);
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

  void applyJob(Job job) {
    _appliedJobs.add(job);
    notifyListeners();
  }
}
