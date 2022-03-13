import 'package:flutter/material.dart';
import 'package:flutter_grade_calculation_app/constants/app_constants.dart';
import 'package:flutter_grade_calculation_app/widgets/grade_calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grade Calculator',
      theme: ThemeData(
          primarySwatch: Constants.mainColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: GradeCalculatorPage(),
    );
  }
}
