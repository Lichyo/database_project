import 'package:flutter/material.dart';
import 'view/welcome_page.dart';
import 'database_service.dart';

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
