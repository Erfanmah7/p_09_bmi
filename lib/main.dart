import 'package:flutter/material.dart';
import 'package:p_09_bmi/screen/home_bmi.dart';
import 'package:p_09_bmi/style.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kblueblackColor,
        appBarTheme: AppBarTheme(backgroundColor: kblueblackColor),
      ),
      home: homeBmi(),
    );
  }
}
