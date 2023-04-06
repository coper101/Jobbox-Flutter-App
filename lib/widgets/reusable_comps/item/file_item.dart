import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/colors.dart';

import '../../../../theme/icons.dart';
import '../visual/icon_image.dart';

class FileItem extends StatelessWidget {
  // -- Props --
  final String title;
  final String fileName;
  final DateTime uploadDate;
  final bool isEditing;

  const FileItem({
    super.key,
    required this.title,
    required this.fileName,
    required this.uploadDate,
    required this.isEditing,
  });

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            MyIcon(
              icon: AppIcons.file,
              length: 38,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat('dd/MM/yy').format(uploadDate),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 13,
                        color: AppColors.brownDark.color,
                      ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
