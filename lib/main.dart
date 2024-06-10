import 'package:database_project/model/course.dart';

import 'database_service.dart';
import 'mock_data/course_mock.dart';

void main() async {
  final DatabaseService _instance = DatabaseService();
  await _instance.ensuredDatabaseActivate();
  await _instance.login(111016041, '2003lichyo');
  if (_instance.isUserLogin) {
    // await _instance.writeCoursesIntoDatabase(
    //     courses: MockCourse().chiyuCourses);
    List<Course> courses = await _instance.getCourse();
    for (Course course in courses) {
      print(course.name);
    }
  }

  // print('Finished');
}
