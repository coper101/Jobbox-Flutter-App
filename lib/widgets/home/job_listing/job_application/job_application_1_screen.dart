import 'package:flutter/material.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/model/file_document.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/model_data/user_model_data.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/dimensions.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/input/file_item_button.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/navigation/top_bar.dart';
import 'package:provider/provider.dart';

import '../../../../theme/icons.dart';

import '../../../reusable_comps/input/filled_button.dart';
import '../../../reusable_comps/visual/icon_image.dart';
import '../../../reusable_comps/visual/step_indicator.dart';
import '../../../home/job_listing/job_application/job_application_2_screen.dart';

import '../../../../model/job.dart';

class JobApplicationSheet1 extends StatelessWidget {
  // -- Props --
  final Job job;

  const JobApplicationSheet1({super.key, required this.job});

  // -- Actions --
  void _onTapClose(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onTapProceed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JobApplicationSheet2(job: job),
        fullscreenDialog: false,
      ),
    );
  }

  void _onTapAddResumeFile() {}

  void _onTapAddCoverLetterFile() {}

  // -- UI --
  Widget _documentItemGroup(
    BuildContext context,
    DocumentCategories category,
    List<FileDocument> files,
    VoidCallback onTapPlus,
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
                    category.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    category.description,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Material(
              child: InkWell(
                child: MyIcon(
                  icon: AppIcons.plus,
                  length: 26,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...files.map((file) => FileItemButton(fileDocument: file)).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final userModelData = Provider.of<UserModelData>(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.only(bottom: Dimensions.bottomPadding),
        alignment: AlignmentDirectional.bottomCenter,
        width: double.infinity,
        height: 58,
        child: MyFilledButton(
          title: 'Proceed',
          onTap: () => _onTapProceed(context),
        ),
      ),
      appBar: TopBar(
        dimissIcon: AppIcons.xmark,
        onTapBack: () => _onTapClose(context),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.only(left: 18, right: 18),
        margin: EdgeInsets.only(
            bottom: 58 + bottomInset + Dimensions.bottomPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Apply to ${job.companyName}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 18),
              const StepIndicator(step: JobApplicationSteps.uploadDocs),
              const SizedBox(height: 18),
              _documentItemGroup(
                context,
                DocumentCategories.resume,
                userModelData.resumes,
                _onTapAddResumeFile,
              ),
              const SizedBox(height: 18),
              _documentItemGroup(
                context,
                DocumentCategories.coverLetter,
                userModelData.coverLetters,
                _onTapAddCoverLetterFile,
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
