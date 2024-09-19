import 'package:flutter/material.dart';
import 'package:untitled/s.dart';
//import 'package:untitled/shared%20preference.dart';
import 'package:untitled/sign.dart';
import 'package:untitled/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: si()
      );
  }
}



