import 'package:database_project/model/course.dart';
import 'package:flutter/material.dart';

class CourseContainer extends StatelessWidget {
  const CourseContainer({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        course.name,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
      ),
      subtitle: Text(
        course.time.toString(),
        style: TextStyle(color: Colors.grey.shade400),
      ),
      isThreeLine: true,
    );
  }
}
