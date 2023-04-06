import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/model/job.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/home/job_listing/job_application/job_application_3_screen.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/input/switch.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/input/text_field.dart';
import 'package:provider/provider.dart';

import '../../../../theme/icons.dart';

import '../../../reusable_comps/input/filled_button.dart';
import '../../../reusable_comps/visual/icon_image.dart';
import '../../../reusable_comps/visual/step_indicator.dart';

class JobApplicationSheet2 extends StatefulWidget {
  // -- Props --
  final Job job;

  const JobApplicationSheet2({super.key, required this.job});

  @override
  State<JobApplicationSheet2> createState() => _JobApplicationSheet2State();
}

class _JobApplicationSheet2State extends State<JobApplicationSheet2> {
  // -- States --
  bool _isEducationIncludeInResume = false;
  bool _isWorkExperienceIncludeInResume = false;

  final _schoolNameTextController = TextEditingController();
  final _courseOfStudyTextController = TextEditingController();
  final _yearGraduatedTextController = TextEditingController();

  final _additionalSkills = TextEditingController();

  // -- Actions --
  void _onTapBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onTapProceed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JobApplicationSheet3(job: widget.job),
        fullscreenDialog: false,
      ),
    );
  }

  void _onToggleEducation(bool newValue) {
    setState(() {
      _isEducationIncludeInResume = newValue;
    });
  }

  void _onToggleWorkExperience(bool newValue) {
    setState(() {
      _isWorkExperienceIncludeInResume = newValue;
    });
  }

  // -- UI --
  Widget _infoGroup(
    BuildContext context,
    String title,
    String? description,
    bool? isToggleOn,
    Function(bool)? onToggle,
    Widget? child,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (description != null)
                    Text(
                      description,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                ],
              ),
            ),
            if (isToggleOn != null && onToggle != null)
              MySwitch(isOn: isToggleOn, onChanged: onToggle),
          ],
        ),
        if (child != null) child,
      ],
    );
  }

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
                'Apply to ${widget.job.companyName}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 18),
              const StepIndicator(step: JobApplicationSteps.employmentInfo),
              const SizedBox(height: 18),
              _infoGroup(
                  context,
                  'Education',
                  'Included in Resume',
                  _isEducationIncludeInResume,
                  _onToggleEducation,
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      MyTextField(
                        props: MyTextFieldProps(
                          title: 'Name of school',
                          placeholder: 'Enter name of school',
                          controller: _schoolNameTextController,
                        ),
                      ),
                      const SizedBox(height: 10),
                      MyTextField(
                        props: MyTextFieldProps(
                          title: 'Course of study',
                          placeholder: 'Enter course of study',
                          controller: _courseOfStudyTextController,
                        ),
                      ),
                      const SizedBox(height: 10),
                      MyTextField(
                        props: MyTextFieldProps(
                          title: 'Year graduated',
                          placeholder: 'Enter year graduated',
                          controller: _yearGraduatedTextController,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  )),
              const SizedBox(height: 16),
              _infoGroup(
                  context,
                  'Work Experience',
                  'Included in Resume',
                  _isWorkExperienceIncludeInResume,
                  _onToggleWorkExperience,
                  null),
              const SizedBox(height: 24),
              _infoGroup(
                context,
                'Additional Skills',
                null,
                null,
                null,
                Column(
                  children: [
                    const SizedBox(height: 2),
                    MyTextField(
                      props: MyTextFieldProps(
                        placeholder: 'Start searching for jobs',
                        isOutlined: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11),
                          child: MyIcon(
                            icon: AppIcons.magnifyingGlass,
                            length: 10,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        controller: _additionalSkills,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
