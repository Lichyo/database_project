import 'package:postgres/postgres.dart';
import 'model/course.dart';
import 'model/student.dart';
import 'package:http/http.dart';
import 'dart:convert';

class DatabaseService {
  Connection? _conn;
  bool isUserLogin = false;
  Student? student;

  Future<void> login(int ID, String password) async {
    final result = await _conn!.execute(
        "SELECT st_name, email, department FROM STUDENT WHERE st_id = '$ID' AND password = '$password';");
    student = Student(
      ID: ID,
      email: result[0][0] as String,
      department: result[0][1] as String,
      name: result[0][2] as String,
    );
    if (student != null) {
      isUserLogin = true;
    }
  }

  Future<List<Course>> getCourse() async {
    List<Course> courses = [];
    final result = await _conn!.execute(
        'SELECT name, teacher, classroom, time, week FROM COURSE WHERE SID = ${student!.ID}');
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
    int courseID = 0;
    for (Course course in courses) {
      var results = await _conn!.execute(
        "INSERT INTO course(course_name, teacher, week, time, classroom)"
        "VALUES ('${course.name}', '${course.teacher}', '${course.week}', '${course.time}', '${course.classroom}')"
        "ON CONFLICT DO NOTHING "
        "RETURNING course_id;",
      );
      if (results.isEmpty) {
        results = await _conn!.execute(
          "SELECT course_id "
          "FROM course "
          "WHERE teacher = '${course.teacher}' AND "
          "week = '${course.week}' AND "
          "time = '${course.time}';",
        );
      }
      courseID = results[0][0] as int;
      _bindingCoursesWithUser(courseID: courseID);
    }
  }

  Future<void> _bindingCoursesWithUser({required int courseID}) async {
    _conn!.execute('INSERT INTO have(st_id, course_id)'
        'VALUES(${student!.ID}, $courseID)');
  }
}
