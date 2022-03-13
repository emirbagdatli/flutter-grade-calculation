// ignore_for_file: unused_local_variable, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_grade_calculation_app/model/course.dart';

class DataHelper {
  static List<Course> allAddedCourses = [];

  static addCourse(Course course) {
    allAddedCourses.add(course);
  }

  static double calculateAvg() {
    double totalGradeValue = 0;
    double totalCredit = 0;

    allAddedCourses.forEach((element) {
      totalGradeValue =
          totalGradeValue + (element.creditValue * element.letterValue);
      totalCredit += element.creditValue;
    });
    return totalGradeValue / totalCredit;
  }

  static List<String> _allLetterGrades() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _numericGrades(String letter) {
    switch (letter) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLetterGrades() {
    return _allLetterGrades()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _numericGrades(e),
            ))
        .toList();
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCourseCredits() {
    return _allCredits()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}
