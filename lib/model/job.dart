enum SalaryType { month, year }

class Salary {
  final SalaryType type;
  final int minimum;
  final int maximum;

  Salary({
    required this.type,
    required this.minimum,
    required this.maximum,
  });
}

class Job {
  final String companyName;
  final String positionTitle;
  final DateTime datePosted;
  final Salary salary;

  Job({
    required this.companyName,
    required this.positionTitle,
    required this.datePosted,
    required this.salary,
  });
}
