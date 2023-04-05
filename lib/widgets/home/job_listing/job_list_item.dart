import 'package:flutter/material.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/model/job.dart';

class JobListItem extends StatelessWidget {
  // -- Props --
  final Job job;

  const JobListItem({super.key, required this.job});

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 21),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 1))
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(job.positionTitle),
                      Text(job.positionTitle),
                    ],
                  ),
                  Text(job.positionTitle)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
