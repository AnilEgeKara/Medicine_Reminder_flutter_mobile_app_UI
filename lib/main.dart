import 'package:flutter/material.dart';
import 'package:healt_app/AddNewReminderScreen.dart';
import 'package:healt_app/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/HomeScreen',
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
        '/AddNewReminderScreen': (context) => AddNewReminderScreen(),
      },
    );
  }
}

