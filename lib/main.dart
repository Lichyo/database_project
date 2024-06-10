import 'database_service.dart';
import 'mock_data/course_mock.dart';

void main() async {
  final DatabaseService _instance = DatabaseService();
  await _instance.ensuredDatabaseActivate();
  await _instance.writeCoursesIntoDatabase(courses: MockCourse().chiyuCourses);
  print('Finished');
}
