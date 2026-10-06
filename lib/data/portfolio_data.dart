class Links {
  static const github = 'https://github.com/nadaeltorgoman';
  static const linkedin = 'https://www.linkedin.com/in/nada-eltorgoman';
  static const email = 'nada.khalid.eltorgoman@gmail.com';
  static const phone = '+201091084009';
  static const phoneDisplay = '+20 109 108 4009';
  static const whatsapp = 'https://wa.me/201091084009';
  static const cv =
      'https://drive.google.com/file/d/1tQMi1QxBBEI2DEM9_GWoXpowAb5ZuqkV/view?usp=sharing';
}

class Profile {
  static const name = 'Nada El-Torgoman';
  static const title = 'Flutter Developer';
  static const location = 'Port Said, Egypt';
  static const tagline =
      'I build production cross-platform mobile apps with clean architecture and a reliable user experience.';
  static const summary =
      'Flutter developer with 2+ years of experience building and maintaining production '
      'cross-platform mobile applications using Bloc/Cubit and REST API integrations. '
      'Experienced in delivering enterprise features — attendance systems, task management, '
      'invoicing, and location-based services — with a focus on clean architecture and '
      'reliable user experience.';

  static const stats = [
    Stat('2+', 'Years of experience'),
    Stat('10+', 'Apps shipped & contributed'),
    Stat('4', 'Apps on Google Play'),
  ];
}

class Stat {
  final String value;
  final String label;
  const Stat(this.value, this.label);
}

class Experience {
  final String role;
  final String company;
  final String period;
  final String location;
  final List<String> points;
  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.points,
  });
}

const experiences = [
  Experience(
    role: 'Mobile App Developer',
    company: 'Logic System',
    period: 'May 2026 – Present',
    location: 'Port Said',
    points: [
      'Maintain and enhance the Inlink Flutter app — an enterprise system for factory operations, sales-rep task management, and customer relationships.',
      'Build features for sales & purchase invoicing, returns, payments, warehouse requests, attendance verification, GPS validation, and device authentication.',
      'Converted the Port Said Souq e-commerce platform into client and vendor Flutter apps using the Prime Web framework.',
      'Built Inlink Restaurant — a Flutter Web QR ordering site where diners browse the menu and place full invoices that reach the cashier by table number.',
    ],
  ),
  Experience(
    role: 'Programming Instructor',
    company: 'Eyouth (DECI)',
    period: 'Apr 2026 – Present',
    location: 'Port Said',
    points: [
      'Deliver technical instruction and assessments for students aged 13–18 in Web Development, Cybersecurity, Python, and Computer Fundamentals.',
    ],
  ),
  Experience(
    role: 'Mobile App Developer',
    company: 'TECFY',
    period: 'Apr 2025 – Mar 2026',
    location: 'Port Said',
    points: [
      'Developed and maintained multiple production Flutter apps, including Tecfy Tickets, Tecfy Attendance, and Bana.',
      'Contributed to development on the KACST project.',
    ],
  ),
  Experience(
    role: 'Mobile Development Instructor',
    company: 'British Council & Maharat Masr',
    period: 'Oct – Nov 2024',
    location: 'Creativa, Port Said — Hybrid',
    points: [
      'Delivered hybrid Flutter training for beginner developers.',
      'Guided participants through building and deploying their first mobile apps.',
    ],
  ),
];

enum ProjectLinkType { play, github, web }

class ProjectLink {
  final ProjectLinkType type;
  final String url;
  const ProjectLink(this.type, this.url);
}

class Project {
  final String name;
  final String category;
  final String period;
  final String description;
  final List<String> tags;
  final ProjectLink? link;
  final bool featured;
  const Project({
    required this.name,
    required this.category,
    required this.period,
    required this.description,
    required this.tags,
    this.link,
    this.featured = false,
  });
}

final projects = [
  const Project(
    name: 'Inlink',
    category: 'Factory & Field Operations',
    period: '2026 – Present',
    description:
        'Enterprise system that organizes factory workflows, manages sales/field reps and their tasks, '
        'handles sales & purchase invoicing, returns, payments, and customer accounts.',
    tags: ['Flutter', 'Bloc/Cubit', 'REST API', 'GPS'],
    link: ProjectLink(
      ProjectLinkType.play,
      'https://play.google.com/store/apps/details?id=com.inlink.app',
    ),
    featured: true,
  ),
  const Project(
    name: 'Inlink Restaurant',
    category: 'QR Menu & Table Ordering',
    period: 'Sep 2026',
    description:
        'Flutter Web ordering site opened from a table QR code: customers browse the menu, build '
        'their full invoice, and the order reaches the cashier tagged with the table number.',
    tags: ['Flutter Web', 'Laravel', 'SQL', 'REST API'],
    link: ProjectLink(
      ProjectLinkType.web,
      'https://insysresapp.inlink-eg.com/?UserName=admin&Pass=1234&store=1&Treasury=2&CusID=11&BillNoteID=5&Note=T1&db=hTbQAakVQQ',
    ),
    featured: true,
  ),
  const Project(
    name: 'Port Said Souq',
    category: 'E-Commerce Client & Vendor Apps',
    period: '2026',
    description:
        'Converted portsaidsouq.com into two Flutter apps — a client-facing app and a vendor '
        'management app — using the Prime Web framework with a Laravel admin panel.',
    tags: ['Flutter', 'Laravel', 'E-Commerce'],
    link: ProjectLink(
      ProjectLinkType.play,
      'https://play.google.com/store/apps/details?id=com.portsaidsouq.app',
    ),
    featured: true,
  ),
  Project(
    name: 'Tecfy Attendance',
    category: 'HR & Attendance Management',
    period: '2025',
    description:
        'Attendance tracking, leave management, and overtime monitoring, improving task visibility '
        'and employee workflow management.',
    tags: const ['Flutter', 'Bloc', 'REST API'],
    link: ProjectLink(
      ProjectLinkType.play,
      'https://play.google.com/store/apps/details?id=co.tecfy.emp',
    ),
  ),
  Project(
    name: 'SUMO',
    category: 'Task & Operations Management',
    period: '2025',
    description:
        'Task assignment, tracking, prioritization, and real-time updates, plus a caravan '
        'management system for booking, key tracking, and room status.',
    tags: const ['Flutter', 'Real-time', 'REST API'],
    link: ProjectLink(
      ProjectLinkType.play,
      'https://play.google.com/store/apps/details?id=co.tecfy.task_management',
    ),
  ),
  Project(
    name: 'Tecfy Ticket',
    category: 'Internal Communication',
    period: '2025',
    description:
        'Internal communication features and a campaigns system for targeted messaging and user segmentation.',
    tags: const ['Flutter', 'Notifications'],
    link: ProjectLink(
      ProjectLinkType.play,
      'https://play.google.com/store/apps/details?id=co.tecfy.ticket',
    ),
  ),
  Project(
    name: 'CarSideAds',
    category: 'Location-Based Advertising',
    period: '2025',
    description:
        'Driver onboarding and verification flows, and a location-based advertisement publishing system.',
    tags: const ['Flutter', 'Google Maps', 'Location'],
    link: ProjectLink(
      ProjectLinkType.play,
      'https://play.google.com/store/apps/details?id=com.carsideads.driver',
    ),
  ),
  const Project(
    name: 'Forme',
    category: 'Fitness & Wellness',
    period: 'Nov 2023 – Present',
    description:
        'Connects users with trainers, clubs, and courses. Integrated Google Maps and Paymob payments, '
        'with a Django backend and admin dashboard.',
    tags: ['Flutter', 'Django', 'Paymob', 'Maps'],
    link: ProjectLink(
      ProjectLinkType.github,
      'https://github.com/nadaeltorgoman/Forme',
    ),
  ),
  const Project(
    name: 'Food Delivery',
    category: 'Delivery & Payments',
    period: 'Sep – Oct 2023',
    description:
        'Flutter app with a Laravel backend: REST APIs, Firebase notifications, shopping cart, PayPal, and Google Maps.',
    tags: ['Flutter', 'Laravel', 'Firebase', 'PayPal'],
    link: ProjectLink(
      ProjectLinkType.github,
      'https://github.com/nadaeltorgoman/Food_Delivery',
    ),
  ),
  const Project(
    name: 'Travel App',
    category: 'Country Exploration',
    period: 'Jul – Sep 2023',
    description:
        'Maps and offline mode support, with a Laravel backend and authentication.',
    tags: ['Flutter', 'Offline', 'Laravel'],
    link: ProjectLink(
      ProjectLinkType.github,
      'https://github.com/nadaeltorgoman/Travel_app',
    ),
  ),
];

const otherContributions = <(String, String?)>[
  ('Bana', 'https://play.google.com/store/apps/details?id=sa.bana.android'),
  ('ResilienzFitness', null),
  (
    'KACST',
    'https://play.google.com/store/apps/details?id=sa.edu.kasct.emp.portal',
  ),
];

class SkillGroup {
  final String title;
  final List<String> items;
  const SkillGroup(this.title, this.items);
}

const skillGroups = [
  SkillGroup('Mobile', [
    'Flutter',
    'Dart',
    'Java',
    'Kotlin',
    'Bloc/Cubit',
    'Hive',
    'MVC/MVVM',
    'Clean Architecture',
  ]),
  SkillGroup('Backend & APIs', [
    'PHP',
    'Laravel',
    'Firebase',
    'REST APIs',
    'Admin Panels',
  ]),
  SkillGroup('Integrations', [
    'Google Maps',
    'Paymob',
    'PayPal',
    'Push Notifications',
  ]),
  SkillGroup('Tools', [
    'Git & GitHub',
    'Figma',
    'Jira',
    'Postman',
    'Android Studio',
    'VS Code',
  ]),
];

class Education {
  final String title;
  final String place;
  final String period;
  final String detail;
  const Education(this.title, this.place, this.period, this.detail);
}

const education = [
  Education(
    'B.Sc. Computer Science',
    'Suez Canal University — Faculty of Computers and Information',
    'Sep 2020 – Jul 2024',
    'Grade: Very Good with Honors',
  ),
  Education(
    'Flutter Advanced Training',
    'Information Technology Institute (ITI) — Ismailia',
    'Jun – Jul 2024',
    'Advanced Flutter, Clean Architecture, and SOLID. Built a movie app with Bloc and the TMDB API.',
  ),
  Education(
    'Project Development Using Python',
    'El-Masria Communications',
    '2022',
    'Python fundamentals and project development.',
  ),
  Education(
    'Oracle SQL, Networking & Server Operations',
    'PSCCHC',
    '2021',
    'Databases, networking basics, and server operations.',
  ),
];
