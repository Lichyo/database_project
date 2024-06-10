import 'database_service.dart';
import 'mock_data/course_mock.dart';

void main() async {
  final DatabaseService _instance = DatabaseService();
  await _instance.ensuredDatabaseActivate();
  await _instance.login(111016032, 'qwasQWAS0924');
  if (_instance.isUserLogin) {
    // print(_instance.student!.ID);
    // print(_instance.student!.name);
    // print(_instance.student!.department);
    // print(_instance.student!.email);
    await _instance.writeCoursesIntoDatabase(courses: MockCourse().yitongCourses);
  }

  // print('Finished');
}
