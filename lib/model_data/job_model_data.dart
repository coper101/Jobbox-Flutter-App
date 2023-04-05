import 'package:flutter/material.dart';

import '../../model/job.dart';

class JobModelData with ChangeNotifier {
  // -- States --
  final _jobs = [
    Job(
      companyName: 'Slack',
      positionTitle: 'Senior Product Designer',
      datePosted: DateTime(2020, 9, 9),
      salary: Salary(
        type: SalaryType.month,
        minimum: 6000,
        maximum: 8000,
      ),
    ),
    Job(
      companyName: 'Crypto.com',
      positionTitle: 'Front-End Developer',
      datePosted: DateTime(2020, 9, 9),
      salary: Salary(
        type: SalaryType.month,
        minimum: 5000,
        maximum: 6000,
      ),
    ),
    Job(
      companyName: 'Amazon',
      positionTitle: 'Product Owner',
      datePosted: DateTime(2020, 9, 7),
      salary: Salary(
        type: SalaryType.month,
        minimum: 8000,
        maximum: 10000,
      ),
    ),
    Job(
      companyName: 'Asana',
      positionTitle: 'Product Owner',
      datePosted: DateTime(2020, 9, 6),
      salary: Salary(
        type: SalaryType.month,
        minimum: 7000,
        maximum: 8000,
      ),
    ),
    Job(
      companyName: 'Google',
      positionTitle: 'Senior Product Designer',
      datePosted: DateTime(2020, 9, 6),
      salary: Salary(
        type: SalaryType.month,
        minimum: 8000,
        maximum: 10000,
      ),
    )
  ];

  List<Job> get jobs {
    return [..._jobs];
  }

  // -- Events --
}
