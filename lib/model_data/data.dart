import '../theme/icons.dart';

import '../../model/user.dart';
import '../../model/job.dart';

// -- Dummy User --
class Users {
  static User user = User(
    email: 'example@mail.com',
    password: 'example',
    firstName: 'Adrian',
    lastName: 'Severin',
    mobileNumber: '6594717281',
  );
}

// -- Dummy Jobs --
class Jobs {
  static List<Job> jobs = [
    Job(
      logo: AppLogos.slack,
      companyName: 'Slack',
      positionTitle: 'Senior Product Designer',
      description:
          "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as...",
      requirements: [
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements'
      ],
      datePosted: DateTime(2020, 9, 9),
      salary: const Salary(
        type: SalaryType.month,
        minimum: 6000,
        maximum: 8000,
      ),
      country: const Country(name: 'Singapore', direction: Directions.east),
    ),
    Job(
      logo: AppLogos.cryptoDotCom,
      companyName: 'Crypto.com',
      positionTitle: 'Front-End Developer',
      description:
          "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as...",
      requirements: [
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements'
      ],
      datePosted: DateTime(2020, 9, 9),
      salary: const Salary(
        type: SalaryType.month,
        minimum: 5000,
        maximum: 6000,
      ),
      country: const Country(name: 'Singapore', direction: Directions.central),
    ),
    Job(
      logo: AppLogos.amazon,
      companyName: 'Amazon',
      positionTitle: 'Product Owner',
      description:
          "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as...",
      requirements: [
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements'
      ],
      datePosted: DateTime(2020, 9, 7),
      salary: const Salary(
        type: SalaryType.month,
        minimum: 8000,
        maximum: 10000,
      ),
      country: const Country(name: 'Singapore', direction: Directions.west),
    ),
    Job(
      logo: AppLogos.asana,
      companyName: 'Asana',
      positionTitle: 'Product Owner',
      description:
          "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as...",
      requirements: [
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements'
      ],
      datePosted: DateTime(2020, 9, 6),
      salary: const Salary(
        type: SalaryType.month,
        minimum: 7000,
        maximum: 8000,
      ),
      country:
          const Country(name: 'Singapore', direction: Directions.northEast),
    ),
    Job(
      logo: AppLogos.google,
      companyName: 'Google',
      positionTitle: 'Senior Product Designer',
      description:
          "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as...",
      requirements: [
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements',
        'Developing product design concepts from client requirements'
      ],
      datePosted: DateTime(2020, 9, 6),
      salary: const Salary(
        type: SalaryType.month,
        minimum: 8000,
        maximum: 10000,
      ),
      country: const Country(name: 'Singapore', direction: Directions.central),
    )
  ];
}
