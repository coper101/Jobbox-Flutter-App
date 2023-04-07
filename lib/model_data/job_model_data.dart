import 'package:flutter/material.dart';

import '../model/job.dart';
import '../model/skill.dart';
import './data.dart';

class JobModelData with ChangeNotifier {
  // -- States --
  final List<Job> _jobs = Jobs.jobs;
  final List<Skill> _skills = Skills.skills;

  List<Job> get jobs {
    return [..._jobs];
  }

  List<Skill> get skills {
    return [..._skills];
  }

  // -- Events --
  void removeSkill(Skill skill) {
    final exists = _skills.any((s) => s.id == skill.id);
    if (!exists) {
      return;
    }
    _skills.removeWhere((s) => s.id == skill.id);
    notifyListeners();
  }
}
