import 'package:flutter/material.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/icons.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/visual/icon_image.dart';

class GroupHeader extends StatelessWidget {
  // -- Props --
  final String title;

  final VoidCallback onTapEdit;
  const GroupHeader({super.key, required this.title, required this.onTapEdit});

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: onTapEdit,
            splashColor: Colors.black.withOpacity(0.1),
            child: Ink(
              color: Colors.transparent,
              width: 22,
              height: 22,
              child: MyIcon(
                icon: AppIcons.pen,
                length: 20,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
    );
  }
}
