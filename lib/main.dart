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
  // await _instance.login(111016041, '2003lichyo');
  // if (_instance.isUserLogin) {
  //   // await _instance.writeCoursesIntoDatabase(
  //   //     courses: MockCourse().chiyuCourses);
  //   List<Course> courses = await _instance.getCourse();
  //   for (Course course in courses) {
  //     print(course.name);
  //   }
  // }
  // print('Finished');
}

class Assistant extends StatelessWidget {
  const Assistant({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
