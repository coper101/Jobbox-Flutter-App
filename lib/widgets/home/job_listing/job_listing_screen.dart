import 'package:flutter/material.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/types.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/home/job_listing/filter_tab_bar.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/home/job_listing/job_list_item.dart';
import 'package:provider/provider.dart';

import 'package:jobbox_app_daryl_sofia_gialolo/theme/icons.dart';

import '../../reusable_comps/icon_image.dart';
import '../../reusable_comps/text_field.dart';

import '../../../model_data/job_model_data.dart';
import '../../../model_data/user_model_data.dart';

class JobListingScreen extends StatefulWidget {
  // -- Props --
  const JobListingScreen({super.key});

  @override
  State<JobListingScreen> createState() => _JobListingScreenState();
}

class _JobListingScreenState extends State<JobListingScreen> {
  // -- States --
  final _searchEditingController = TextEditingController();

  // -- UI --
  Widget _topBar(BuildContext context, String message) {
    final topInset = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: topInset, left: 21, right: 21),
      width: double.infinity,
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(
              fontFamily: FontFamilies.poppins.name,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Find The Best Job Here!',
            style: TextStyle(
              fontFamily: FontFamilies.antourOne.name,
              fontSize: 23,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          MyTextField(
            placeholder: 'Start searching for jobs',
            isOutlined: false,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: MyIcon(
                icon: AppIcons.magnifyingGlass,
                length: 10,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            controller: _searchEditingController,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userModelData = Provider.of<UserModelData>(context);
    final jobModelData = Provider.of<JobModelData>(context);

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          _topBar(context, userModelData.greeting),
          const FilterTabBar(),
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 0),
              itemBuilder: (_, index) =>
                  JobListItem(job: jobModelData.jobs[index]),
              itemCount: jobModelData.jobs.length,
            ),
          ),
        ],
      ),
    );
  }
}
