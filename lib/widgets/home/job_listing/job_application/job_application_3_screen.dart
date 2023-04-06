import 'package:flutter/material.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/model/job.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/model_data/user_model_data.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/input/dynamic_text_field.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/input/text_field.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/item/file_item.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/item/group_header.dart';
import 'package:provider/provider.dart';

import '../../../../theme/icons.dart';

import '../../../reusable_comps/input/filled_button.dart';
import '../../../reusable_comps/visual/icon_image.dart';
import '../../../reusable_comps/visual/step_indicator.dart';

class JobApplicationSheet3 extends StatefulWidget {
  // -- Props --
  final Job job;

  const JobApplicationSheet3({super.key, required this.job});

  @override
  State<JobApplicationSheet3> createState() => _JobApplicationSheet3State();
}

class _JobApplicationSheet3State extends State<JobApplicationSheet3> {
  // -- States --
  final _fullNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _mobileNumberTextController = TextEditingController();

  bool _isContactInfoEditing = false;
  bool _isEmploymentInfoEditing = false;

  UserModelData? userModelData;

  // -- Lifecycle --
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userModelData = Provider.of<UserModelData>(context, listen: false);
      setState(() {
        _fullNameTextController.text = userModelData?.fullName ?? '';
        _emailTextController.text = userModelData?.emailAddress ?? '';
        _mobileNumberTextController.text = userModelData?.mobileNumber ?? '';
      });
    });
  }

  // -- Actions --
  void _onTapBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onTapSubmit(BuildContext context) {
    final modelData = Provider.of<UserModelData>(context, listen: false);
    modelData.applyJob(widget.job, onDone: () {
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
  }

  void onTapEditContactInfo() {
    setState(() {
      _isContactInfoEditing = !_isContactInfoEditing;
    });
  }

  void onTapEditEmploymentInfo() {
    setState(() {
      _isEmploymentInfoEditing = !_isEmploymentInfoEditing;
    });
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
          title: 'Submit',
          onTap: () => _onTapSubmit(context),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        padding: EdgeInsets.only(top: topInset, left: 18, right: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
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
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const StepIndicator(step: JobApplicationSteps.employmentInfo),
              const SizedBox(height: 24),
              GroupHeader(
                title: 'Contact Info',
                onTapEdit: onTapEditContactInfo,
              ),
              const SizedBox(height: 18),
              CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage(AppImages.face.path),
              ),
              const SizedBox(height: 12),
              DynamicTextField(
                isEditing: _isContactInfoEditing,
                props: MyTextFieldProps(
                  title: 'Full Name',
                  placeholder: 'Enter Full Name',
                  controller: _fullNameTextController,
                ),
              ),
              const SizedBox(height: 10),
              DynamicTextField(
                isEditing: _isContactInfoEditing,
                props: MyTextFieldProps(
                  title: 'Email',
                  placeholder: 'Enter Email',
                  controller: _emailTextController,
                ),
              ),
              const SizedBox(height: 10),
              DynamicTextField(
                isEditing: _isContactInfoEditing,
                props: MyTextFieldProps(
                  title: 'Mobile Number',
                  placeholder: 'Enter Mobile Number',
                  controller: _mobileNumberTextController,
                ),
              ),
              const SizedBox(height: 14),
              const Divider(),
              const SizedBox(height: 14),
              GroupHeader(
                title: 'Employment Information',
                onTapEdit: onTapEditEmploymentInfo,
              ),
              const SizedBox(height: 12),
              if (userModelData?.selectedResume != null)
                FileItem(
                  title: 'Resume',
                  fileDocument: userModelData!.selectedResume!,
                  isEditing: _isEmploymentInfoEditing,
                ),
              const SizedBox(height: 10),
              if (userModelData?.selectedCoverLetter != null)
                FileItem(
                  title: 'Cover Letter',
                  fileDocument: userModelData!.selectedCoverLetter!,
                  isEditing: _isEmploymentInfoEditing,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
