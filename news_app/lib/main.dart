import 'package:flutter/material.dart';
import 'package:news_app/news_screen.dart';
import 'package:news_app/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: NewsScreen(),
    );
  }
}
