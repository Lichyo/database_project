import 'package:database_project/model/course.dart';
import 'package:flutter/material.dart';
import 'package:database_project/components/week_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoad = false;
  bool isNoData = false;
  List<Course> courses = [];

  bool isWeekHasData(String week) {
    for (int index = 0; index < courses.length; index++) {
      if (courses[index].week == week) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoad
          ? const CircularProgressIndicator()
          : isNoData
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '查無資料',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 40.0),
                      ),
                      Text(
                        '請確認學號和密碼是否和登入iNTUE同一組',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '請至設定頁面更改，或聯絡開發人員',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              : Scaffold(
                  body: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    children: [
                      Column(
                        children: [
                          Visibility(
                            visible: isWeekHasData('Mon'),
                            child: WeekContainer(week: 'Mon', courses: courses),
                          ),
                          Visibility(
                            visible: isWeekHasData('Tues'),
                            child:
                                WeekContainer(week: 'Tues', courses: courses),
                          ),
                          Visibility(
                            visible: isWeekHasData('Wed'),
                            child: WeekContainer(week: 'Wed', courses: courses),
                          ),
                          Visibility(
                            visible: isWeekHasData('Thur'),
                            child:
                                WeekContainer(week: 'Thur', courses: courses),
                          ),
                          Visibility(
                            visible: isWeekHasData('Fri'),
                            child: WeekContainer(week: 'Fri', courses: courses),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
    );
  }
}
