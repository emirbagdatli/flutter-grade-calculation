// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_grade_calculation_app/constants/app_constants.dart';

class ShowAvarageGrade extends StatelessWidget {
  final double avarage;
  final int numoflessons;
  const ShowAvarageGrade(
      {required this.avarage, required this.numoflessons, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(numoflessons > 0 ? '$numoflessons course added' : 'Add Course',
            style: Constants.gradecalcStyle),
        Text(
          avarage >= 0 ? '${avarage.toStringAsFixed(2)}' : '0.0',
          style: Constants.avarageStyle,
        ),
        Text('GPA', style: Constants.gradecalcStyle),
      ],
    );
  }
}
