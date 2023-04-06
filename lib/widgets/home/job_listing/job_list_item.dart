import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../theme/icons.dart';

import '../../../widgets/home/job_listing/job_detail_sheet.dart';
import '../../reusable_comps/icon_image.dart';

import '../../../model/job.dart';

class JobListItem extends StatelessWidget {
  // -- Props --
  final Job job;

  const JobListItem({super.key, required this.job});

  // -- Actions --
  void onTapItem(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      builder: (builder) {
        return JobDetailSheet(job: job);
      },
    );
  }

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          left: 5,
          right: 5,
          top: 5,
          bottom: 5,
          child: Container(
            width: 1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  spreadRadius: 5,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
          child: Material(
            color: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              splashColor: Colors.black.withOpacity(0.1),
              onTap: () => onTapItem(context),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 21, right: 21, top: 14, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          job.companyName.toUpperCase(),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          DateFormat('dd MMM yyyy').format(job.datePosted),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      job.positionTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: [
                            MyIcon(
                              icon: AppIcons.sack,
                              length: 16,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              job.salaryDescription,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Text(
                          job.location,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
