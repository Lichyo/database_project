import 'package:database_project/model/course.dart';
import 'package:flutter/material.dart';
import 'package:database_project/components/lesson/week_container.dart';
import 'package:database_project/db/lesson_database.dart';
import 'package:database_project/models/lesson/lesson.dart';
import 'package:database_project/models/lesson/lesson_controller.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:database_project/models/account/account.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  bool isLoad = false;
  bool isNoData = false;
  List<Course> lessons = [];

  @override
  void initState() {
    super.initState();
    refreshCurriculum();
  }

  bool isWeekHasData(String week) {
    for (int index = 0; index < lessons.length; index++) {
      if (lessons[index].week == week) {
        return true;
      }
    }
    return false;
  }

  Future refreshCurriculum() async {
    setState(() => isLoad = true);
    final tempLessons = await LessonDatabase.instance.readAllLesson();
    setState(() {
      lessons = tempLessons;
    });
    if (lessons.isEmpty) {
      await initCurriculum();
      isNoData = lessons.isEmpty ? true : false;
    }
    setState(() => isLoad = false);
  }

  Future initCurriculum() async {
    var lessonsFromWeb = await get(Uri.parse(
        'http://100.76.56.129:5001?account=${111016041}&password=${'2003lichyo'}'));
    var map = jsonDecode(lessonsFromWeb.body);
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
                  floatingActionButton: FloatingActionButton(
                    onPressed: () async {
                      setState(() {
                        LessonDatabase.instance.deleteAllLesson();
                        refreshCurriculum();
                      });
                    },
                    child: const Icon(Icons.refresh),
                  ),
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
                            child: WeekContainer(week: 'Mon', lessons: lessons),
                          ),
                          Visibility(
                            visible: isWeekHasData('Tues'),
                            child:
                                WeekContainer(week: 'Tues', lessons: lessons),
                          ),
                          Visibility(
                            visible: isWeekHasData('Wed'),
                            child: WeekContainer(week: 'Wed', lessons: lessons),
                          ),
                          Visibility(
                            visible: isWeekHasData('Thur'),
                            child:
                                WeekContainer(week: 'Thur', lessons: lessons),
                          ),
                          Visibility(
                            visible: isWeekHasData('Fri'),
                            child: WeekContainer(week: 'Fri', lessons: lessons),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
    );
  }
}
