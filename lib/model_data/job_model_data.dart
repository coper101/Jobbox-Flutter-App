import 'package:flutter/material.dart';

import '../model_data/data.dart';
import '../../model/job.dart';

class JobModelData with ChangeNotifier {
  // -- States --
  final List<Job> _jobs = Jobs.jobs;

  List<Job> get jobs {
    return [..._jobs];
  }

  // -- Events --
}
