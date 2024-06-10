import 'package:postgres/postgres.dart';
import 'model/course.dart';
import 'model/student.dart';
import 'package:http/http.dart';
import 'dart:convert';

class DatabaseService {
  Connection? _conn;
  bool _isUserLogin = false;
  Student? _student;

  Future<void> login(int ID, String password) async {
    final result = await _conn!.execute(
        'SELECT name, email, department FROM STUDENT WHERE $ID = ID AND $password = password;');
    _student = Student(
      ID: ID,
      email: result[0][0] as String,
      department: result[0][1] as String,
      name: result[0][2] as String,
    );
    if (_student != null) {
      _isUserLogin = true;
    }
  }

  Future<List<Course>> getCourse() async {
    List<Course> courses = [];
    final result = await _conn!.execute(
        'SELECT name, teacher, classroom, time, week FROM COURSE WHERE SID = ${_student!.ID}');
    for (var course in result) {
      String name = course[0] as String;
      String teacher = course[1] as String;
      String classroom = course[2] as String;
      String time = course[3] as String;
      String week = course[4] as String;
      courses.add(
        Course(
          name: name,
          teacher: teacher,
          classroom: classroom,
          time: time,
          week: week,
        ),
      );
    }
    return courses;
  }

  Future<void> ensuredDatabaseActivate() async {
    _conn = await Connection.open(
      Endpoint(
        host: 'localhost',
        database: 'database_project',
        username: 'postgres',
        password: '2003Lichyo!',
      ),
      settings: const ConnectionSettings(sslMode: SslMode.disable),
    );
  }

  Future<void> _getLessonFromWeb() async {
    var courseFromWeb = await get(Uri.parse(
        'http://100.76.56.129:5001?account=${111016041}&password=${'2003lichyo'}'));
    var data = jsonDecode(courseFromWeb.body);
  }

  Future<void> writeCoursesIntoDatabase({required List<Course> courses}) async {
    for (Course course in courses) {
      _conn!.execute(
          "INSERT INTO course(course_name, teacher, week, time, classroom)"
          "VALUES ('${course.name}', '${course.teacher}', '${course.week}', '${course.time}', '${course.classroom}');");
    }
  }
}
