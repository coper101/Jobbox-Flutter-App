import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/icons.dart';

class MyIcon extends StatelessWidget {
  // -- Props --
  final AppIcons icon;
  final double length;
  final Color? color;

  const MyIcon({
    super.key,
    required this.icon,
    this.length = 22,
    this.color,
  });

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon.path,
      width: length,
      height: length,
      color: color,
    );
  }
}
