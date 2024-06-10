import 'package:database_project/model/course.dart';
import 'package:flutter/material.dart';
import 'package:database_project/view/note_input_page.dart';

class CourseContainer extends StatelessWidget {
  const CourseContainer({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => InputPage(course: course,),
          ),
        );
      },
      child: ListTile(
        title: Text(
          course.name,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
        ),
        subtitle: Text(
          course.time.toString(),
          style: TextStyle(color: Colors.grey.shade400),
        ),
        isThreeLine: true,
      ),
    );
  }
}
