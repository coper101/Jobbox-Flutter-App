import 'package:flutter/material.dart';

import 'package:jobbox_app_daryl_sofia_gialolo/theme/icons.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/types.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/visual/icon_image.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  // -- Props --
  final double height;
  final double leadingIconWidth;
  final AppIcons dimissIcon;
  final String? centerTitle;
  final VoidCallback onTapBack;

  const TopBar({
    super.key,
    this.height = 36,
    this.leadingIconWidth = 48,
    required this.dimissIcon,
    this.centerTitle,
    required this.onTapBack,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      title: (centerTitle != null)
          ? Text(
              centerTitle!,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: FontFamilies.antourOne.name,
              ),
            )
          : null,
      leadingWidth: leadingIconWidth,
      leading: Container(
        width: leadingIconWidth,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        margin: const EdgeInsets.only(left: 8, bottom: 8),
        child: Material(
          child: InkWell(
            splashColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            onTap: onTapBack,
            child: MyIcon(
              icon: dimissIcon,
              color: Theme.of(context).colorScheme.onBackground,
              length: leadingIconWidth,
            ),
          ),
        ),
      ),
    );
  }
}
