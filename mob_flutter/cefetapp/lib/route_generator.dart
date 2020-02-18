import 'package:cefetapp/home_page.dart';
import 'package:cefetapp/library_page.dart';
import 'package:cefetapp/login_page.dart';
import 'package:cefetapp/schedule_page.dart';
import 'package:cefetapp/subject.dart';
import 'package:cefetapp/subject_details_page.dart';
import 'package:cefetapp/subjects_page.dart';
import 'package:flutter/material.dart';

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
