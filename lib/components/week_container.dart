import 'package:flutter/material.dart';
import 'package:database_project/components/course_container.dart';
import 'package:database_project/model/course.dart';

List<CourseContainer> getWeekData(String week, List<Course> courses) {
  List<CourseContainer> courseContainers = [];
  for (Course course in courses) {
    if (course.week == week) {
      courseContainers.add(
        CourseContainer(course: course),
      );
    }
  }
  return courseContainers;
}

class WeekContainer extends StatelessWidget {
  const WeekContainer({
    super.key,
    required this.week,
    required this.courses,
  });

  final String week;
  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            week,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Column(
            children: getWeekData(week, courses),
          ),
        ],
      ),
    );
  }
}
