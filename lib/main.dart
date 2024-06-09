import 'database_service.dart';
import 'model/course.dart';

void main() async {
  final DatabaseService _instance = DatabaseService();
  await _instance.ensuredDatabaseActivate();
  await _instance.login(111016041, '2003lichyo');
  List<Course> courses = await _instance.getCourse();
  print(courses[0].teacher);
}
