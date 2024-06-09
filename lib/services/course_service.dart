import 'package:database_project/model/course.dart';

class CourseService {
  List<Course> courses = [];

  List<Course> getWeekData(
      {required List<Course> courses, required String week}) {
    List<Course> newCourses = [];
    for (int index = 0; index < courses.length; index++) {
      if (courses[index].week == week) {
        newCourses.add(courses[index]);
      }
    }
    return newCourses;
  }

  void initCourse({required Map file, required String? id}) {
    var data = file[id];
    List<Course> tempCourse = [];
    for (int i = 0; i < file[id].length; i++) {
      if (data[i]['lessonTime'][0] == '一') {
        tempCourse.add(Course(
            name: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Mon',
            teacher: data[i]['teacher'],
            classroom: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '二') {
        tempCourse.add(Course(
            name: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Tues',
            teacher: data[i]['teacher'],
            classroom: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '三') {
        tempCourse.add(Course(
            name: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Wed',
            teacher: data[i]['teacher'],
            classroom: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '四') {
        tempCourse.add(Course(
            name: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: "Thur",
            teacher: data[i]['teacher'],
            classroom: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '五') {
        tempCourse.add(
          Course(
            name: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Fri',
            teacher: data[i]['teacher'],
            classroom: data[i]['lessonClass'],
          ),
        );
      }
    }
    courses = tempCourse;
  }
}
