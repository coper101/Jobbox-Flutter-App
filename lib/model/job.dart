// -- Salary --
import 'package:jobbox_app_daryl_sofia_gialolo/theme/icons.dart';

enum SalaryType { month, year }

class Salary {
  final SalaryType type;
  final int minimum;
  final int maximum;

  const Salary({
    required this.type,
    required this.minimum,
    required this.maximum,
  });
}

// -- Country --
enum Directions { central, west, east, northEast }

extension DirectionsExtension on Directions {
  String get title {
    switch (this) {
      case Directions.central:
        return 'Central';
      case Directions.west:
        return 'West';
      case Directions.east:
        return 'East';
      case Directions.northEast:
        return 'North-East';
    }
  }
}

class Country {
  final String name;
  final Directions direction;

  const Country({required this.name, required this.direction});
}

// -- Job --
class Job {
  final AppLogos logo;
  final String companyName;
  final String positionTitle;
  final String description;
  final List<String> requirements;
  final DateTime datePosted;
  final Salary salary;
  final Country country;

  Job({
    required this.logo,
    required this.companyName,
    required this.positionTitle,
    required this.description,
    required this.requirements,
    required this.datePosted,
    required this.salary,
    required this.country,
  });

  String get salaryDescription {
    final min = (salary.minimum / 1000).round();
    final max = (salary.maximum / 1000).round();
    return '\$${min}k-\$${max}k/${salary.type.name}';
  }

  String get location {
    return '${country.direction.title}, ${country.name}';
  }
}
