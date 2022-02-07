import 'package:flutter/material.dart';
import 'package:steamy_draw/pages/home/home_page.dart';
import 'package:steamy_draw/resources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTexts.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'IranSans',
      ),
      home: const HomePage(),
    );
  }
}
