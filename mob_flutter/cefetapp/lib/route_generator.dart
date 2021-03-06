import 'package:cefetapp/features/report/presentation/pages/report_page.dart';
import 'package:flutter/material.dart';

import 'core/domain/entities/subject.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/library/presentation/pages/library_page.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/subjects/presentation/pages/schedule_page.dart';
import 'features/subjects/presentation/pages/subject_details_page.dart';
import 'features/subjects/presentation/pages/subjects_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/schedule':
        return MaterialPageRoute(builder: (_) => SchedulePage());
      case '/library':
        return MaterialPageRoute(builder: (_) => LibraryPage());
      case '/report':
        return MaterialPageRoute(builder: (_) => ReportPage());
      case '/subjects':
        return MaterialPageRoute(builder: (_) => SubjectsPage());
      case '/subject_details':
        if (args is Subject)
          return MaterialPageRoute(
              builder: (_) => SubjectDetailsPage(subject: args));
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('Erro')),
          body: Center(
            child: Text('Ops! Ocorreu um erro'),
          ),
        );
      },
    );
  }
}
