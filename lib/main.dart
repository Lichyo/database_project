import 'database_service.dart';
import 'model/course.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() async {
  // final DatabaseService _instance = DatabaseService();
  // await _instance.ensuredDatabaseActivate();
  // await _instance.login(111016041, '2003lichyo');
  // List<Course> courses = await _instance.getCourse();
  // print(courses[0].teacher);
  var courseFromWeb = await get(Uri.parse(
      'http://100.76.56.129:5001?account=${111016041}&password=${'2003lichyo'}'));
  var data = jsonDecode(courseFromWeb.body);
}
