import 'package:postgres/postgres.dart';
import 'model/course.dart';
import 'model/student.dart';

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
      name: result[02] as String,
    );
    if (_student != null) {
      _isUserLogin = true;
    }
  }

  Future<List<Course>> getCourse() async {
    List<Course> courses = [];
    final result = await _conn!.execute(
        'SELECT id, teacher, classroom, time, week, name FROM COURSE WHERE SID = ${_student!.ID}');
    for (var course in result) {
      String id = course[0] as String;
      String teacher = course[1] as String;
      String classroom = course[2] as String;
      String time = course[3] as String;
      String week = course[4] as String;
      String name = course[5] as String;
      courses.add(
        Course(
          id: id,
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
}
