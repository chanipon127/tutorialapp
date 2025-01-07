import 'package:flutter/material.dart';
import 'package:tutorialapp/my_stateful_widget.dart';
import 'package:tutorialapp/page_answer/answer1.dart';
import 'package:tutorialapp/page_answer/answer2.dart';
import 'package:tutorialapp/page_answer/answer3.dart';
import 'package:tutorialapp/page_answer/answer4.dart';
//import 'package:flutter/material.dart';
//import 'D:\640710504\tutorialapp\page_answer\answer1.dart';

void main() {
  runApp(const MyApp());
}

class GreetingWidget extends StatelessWidget {
  final String name;
  const GreetingWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Demo App'),
          backgroundColor: const Color.fromARGB(255, 121, 85, 72),
        ),
        body: Center(child: Text('Hello,$name')));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}
