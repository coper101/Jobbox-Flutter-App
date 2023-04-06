import 'package:flutter/material.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/colors.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/icons.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/filled_button.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/icon_box_button.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/logo_image.dart';

import '../../../model/job.dart';

class JobDetailSheet extends StatelessWidget {
  // -- Props --
  final Job job;

  const JobDetailSheet({super.key, required this.job});

  // -- Actions --
  void _onTapApply() {}

  void _onTapBookmark() {}

  // -- UI --
  Widget _header(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _topBar() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 5.5,
            width: 148,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.blueTint.color,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context, ThemeData theme) {
    final bottomInset = MediaQuery.of(context).padding.bottom + 52;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 36),
                MyLogo(logo: job.logo),
                const SizedBox(height: 20),
                Text(
                  job.companyName.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                ),
                Text(
                  job.positionTitle,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  job.location,
                  style: theme.textTheme.labelMedium?.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 24),
                _header(context, 'Job Description'),
                const SizedBox(height: 4),
                Text(
                  job.description,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                _header(context, 'Requirements'),
                const SizedBox(height: 4),
                ...job.requirements
                    .map((requirement) => Text('- $requirement'))
                    .toList(),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 84,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBar(BuildContext context, ThemeData theme) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    return Positioned(
      bottom: bottomInset,
      left: 0,
      right: 0,
      child: Row(
        children: [
          Flexible(
            child: MyFilledButton(
              title: 'Apply This Job',
              onTap: () => {},
            ),
          ),
          const SizedBox(width: 12),
          IconBoxButton(
            icon: AppIcons.bookmark,
            onTap: () => {},
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: height * 0.8,
        child: Stack(
          children: [
            _content(context, theme),
            _topBar(),
            _bottomBar(context, theme),
          ],
        ),
      ),
    );
  }
}
