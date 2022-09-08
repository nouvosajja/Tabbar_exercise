import 'package:flutter/material.dart';
import 'package:tugas3/TabbarExample.dart';
import 'package:tugas3/Twitter.dart';
import 'package:tugas3/Profile.dart';
import 'package:tugas3/ListFootballPL.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: const TabbarExample(),
    );
  }
}