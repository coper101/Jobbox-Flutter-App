import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/colors.dart';
import 'package:provider/provider.dart';

import './theme/types.dart';

import './widgets/home/home.dart';
import './widgets/authentication/sign_up_screen.dart';

import './model_data/user_model_data.dart';
import './model_data/job_model_data.dart';

void main() => runApp(const JobboxApp());

class JobboxApp extends StatelessWidget {
  // -- Props --
  const JobboxApp({super.key});

  // -- UI --
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => UserModelData()),
        ChangeNotifierProvider(create: (c) => JobModelData()),
      ],
      child: MaterialApp(
        home: const Home(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.black,
            secondary: Colors.orange,
            onSecondary: Colors.white,
            background: AppColors.background.color,
            surface: Colors.white,
          ),
          primarySwatch: Colors.orange,
          primaryColor: Colors.black,
          fontFamily: FontFamilies.raleway.name,
        ),
        routes: {
          SignUpScreen.routeName: (c) => const SignUpScreen(),
        },
      ),
    );
  }
}
