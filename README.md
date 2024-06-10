# Database Project
an App for students in NTUE.
## Set Up
make sure you follow the steps belows
### First Step
In order to use this app,
you have to lib/database_service.dart
ensuredDatabaseActivate function to change username & password
and make sure you have already download and create "database_project"

### Second Step
In PostgreSQL doing the following queries :
```roomsql
CREATE TABLE student(
st_id CHAR(9) PRIMARY KEY,
st_name VARCHAR(50) NOT NULL,
department VARCHAR(50) NOT NULL,
email VARCHAR(250) UNIQUE NOT NULL,
password VARCHAR(20) NOT NULL
);
```
```roomsql
CREATE TABLE course (
course_id serial PRIMARY KEY,
course_name VARCHAR(100),
teacher VARCHAR(100),
week VARCHAR(50),
time VARCHAR(50),
classroom VARCHAR(100),
CONSTRAINT unique_course UNIQUE (teacher, week, time);
);
```
```roomsql
CREATE TABLE have (
st_id CHAR(9),
course_id SERIAL NOT NULL,
FOREIGN KEY (st_id) REFERENCES student(st_id),
FOREIGN KEY (course_id) REFERENCES course(course_id),
UNIQUE (st_id, course_id);
);
```
```roomsql
CREATE TABLE note(
note_id SERIAL PRIMARY KEY,
subject VARCHAR(50) NOT NULL,
content VARCHAR(2500),
due_date TIMESTAMP,
st_id VARCHAR(9) NOT NULL,
course_id SERIAL NOT NULL,
FOREIGN KEY (st_id) REFERENCES student(st_id),
foreign key (course_id) references course(course_id);
);
```
```roomsql
INSERT INTO student(st_id, st_name, department, email, password)
VALUES(111016041, 'chi-yu', '資訊科學系', 'xxxxxx@gmail.com', 'xxxxxxxx');
```
```roomsql
INSERT INTO student(st_id, st_name, department, email, password)
VALUES(111016032, 'Yi-Tong', '資訊科學系', 'oooooo@gmail.com', 'xxxxxxxx');
````


then, in main() run below statements
```dart
import 'package:flutter/material.dart';
import 'view/welcome_page.dart';
import 'database_service.dart';
import 'mock_data/course_mock.dart';

void main() async {
  await DatabaseService.ensuredDatabaseActivate();
  await DatabaseService.login(ID: 111016041, password: 'xxxxxxxx');
  await DatabaseService.writeCoursesIntoDatabase(courses: MockCourse().chiyuCourses);
  await DatabaseService.login(ID: 111016032, password: 'xxxxxxxx');
  await DatabaseService.writeCoursesIntoDatabase(courses: MockCourse().yitongCourses);
}
```
finally, change your main.dart into this
```dart
import 'package:flutter/material.dart';
import 'view/welcome_page.dart';
import 'database_service.dart';
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
      theme: ThemeData.dark(),
      home: const LoginPage(),
    );
  }
}

```