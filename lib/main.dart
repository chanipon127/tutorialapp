import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_test/firebase_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Products(),
    );
  }
}
