import 'package:database_project/model/course.dart';
import 'package:flutter/material.dart';
import 'package:database_project/components/week_container.dart';
import 'package:database_project/model/course.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.courses});

  final List<Course> courses;

  bool isWeekHasData(String week) {
    for (Course course in courses) {
      if (week == course.week) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IRC Assistant'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NotePage(),
                ),
              );
            },
            icon: const Icon(Icons.bookmark_add_outlined),
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        children: [
          Column(
            children: [
              Visibility(
                visible: isWeekHasData('一'),
                child: WeekContainer(week: '一', courses: courses),
              ),
              Visibility(
                visible: isWeekHasData('二'),
                child: WeekContainer(week: '二', courses: courses),
              ),
              Visibility(
                visible: isWeekHasData('三'),
                child: WeekContainer(week: '三', courses: courses),
              ),
              Visibility(
                visible: isWeekHasData('四'),
                child: WeekContainer(week: '四', courses: courses),
              ),
              Visibility(
                visible: isWeekHasData('五'),
                child: WeekContainer(week: '五', courses: courses),
              ),
            ],
          ),
        ],
      ),
    );
  }
}