import 'package:database_project/model/course.dart';
import 'package:database_project/view/homepage.dart';
import 'package:flutter/material.dart';
import 'view/welcome_page.dart';
import 'database_service.dart';
import 'package:provider/provider.dart';
import 'mock_data/course_mock.dart';

void main() async {
  await DatabaseService.ensuredDatabaseActivate();
  runApp(const Assistant());
}

class Assistant extends StatelessWidget {
  const Assistant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const LoginPage(),
    );
  }
}
