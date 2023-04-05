import 'package:flutter/material.dart';

enum AppColors { background }

extension AppColorsExtension on AppColors {
  Color get color {
    switch (this) {
      case AppColors.background:
        return const Color(0xFFFFFCFA);
    }
  }
}
