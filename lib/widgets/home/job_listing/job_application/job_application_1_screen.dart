import 'package:flutter/material.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/home/job_listing/job_application/job_application_2_screen.dart';

import '../../../../theme/icons.dart';

import '../../../reusable_comps/input/filled_button.dart';
import '../../../reusable_comps/visual/icon_image.dart';
import '../../../reusable_comps/visual/step_indicator.dart';

class JobApplicationSheet1 extends StatelessWidget {
  // -- Props --
  const JobApplicationSheet1({super.key});

  // -- Actions --
  void _onTapClose(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onTapProceed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const JobApplicationSheet2(),
        fullscreenDialog: false,
      ),
    );
  }

  // -- UI --
  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.only(top: topInset, left: 18, right: 18),
      child: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                child: InkWell(
                  onTap: () => _onTapClose(context),
                  child: MyIcon(
                    icon: AppIcons.xmark,
                    color: Theme.of(context).primaryColor,
                    length: 26,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Apply to Slack',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 18),
              const StepIndicator(step: JobApplicationSteps.uploadDocs)
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Material(
            child: Flexible(
              child: MyFilledButton(
                title: 'Proceed',
                onTap: () => _onTapProceed(context),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
