import 'package:flutter/material.dart';
import 'package:tutorialapp/page_answer/answer1.dart';
import 'package:tutorialapp/page_answer/answer2.dart';
import 'package:tutorialapp/page_answer/answer3.dart';
import 'package:tutorialapp/page_answer/answer4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tutorial app',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const PortalScreen(),
    );
  }
}

class PortalScreen extends StatelessWidget {
  const PortalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Answer'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.lightBlue[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GridLayout()),
                    );
                  },
                  child: const Text('Answer1')),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SocialMediaPost()),
                    );
                  },
                  child: const Text('Answer2')),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductLayout()),
                    );
                  },
                  child: const Text('Answer3')),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    );
                  },
                  child: const Text('Answer4')),
            ),
          ],
        ),
      ),
    );
  }
}
