import 'package:database_project/model/course.dart';
import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  InputPage({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: titleController,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Title...',
                    hintStyle: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60,
                    ),
                  ),
                ),
                TextField(
                  controller: contentController,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 30,
                  decoration: const InputDecoration(
                    hintText: 'Content...',
                    hintStyle: TextStyle(fontSize: 30, color: Colors.white60),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () async {
          //TODO: Implement Database statement 妹妹呀 加油加油喔！！！
          // 上面幫你留 course 了喔
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.save,
          size: 40,
        ),
      ),
    );
  }
}
