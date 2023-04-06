import 'package:flutter/material.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/home/job_listing/job_application/job_application_3_screen.dart';

import '../../../../theme/icons.dart';

import '../../../reusable_comps/input/filled_button.dart';
import '../../../reusable_comps/visual/icon_image.dart';
import '../../../reusable_comps/visual/step_indicator.dart';

class JobApplicationSheet2 extends StatelessWidget {
  // -- Props --
  const JobApplicationSheet2({super.key});

  // -- Actions --
  void _onTapBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onTapProceed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const JobApplicationSheet3(),
        fullscreenDialog: false,
      ),
    );
  }

  // -- UI --
  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        alignment: AlignmentDirectional.bottomCenter,
        width: double.infinity,
        height: 58,
        child: MyFilledButton(
          title: 'Proceed',
          onTap: () => _onTapProceed(context),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        padding: EdgeInsets.only(top: topInset, left: 18, right: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                child: InkWell(
                  onTap: () => _onTapBack(context),
                  child: MyIcon(
                    icon: AppIcons.chevronLeft,
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
              const StepIndicator(step: JobApplicationSteps.employmentInfo)
            ],
          ),
        ),
      ),
    );
  }
}
