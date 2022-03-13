// ignore_for_file: prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_is_empty, curly_braces_in_flow_control_structures, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grade_calculation_app/constants/app_constants.dart';
import 'package:flutter_grade_calculation_app/helper/data_helper.dart';
import 'package:flutter_grade_calculation_app/model/course.dart';
import 'package:flutter_grade_calculation_app/widgets/avarage_grade.dart';
import 'package:flutter_grade_calculation_app/widgets/course_list.dart';
import 'package:flutter_grade_calculation_app/widgets/credit_dropdown_widget.dart';
import 'package:flutter_grade_calculation_app/widgets/letter_dropdown_widget.dart';
//import 'package:google_fonts/google_fonts.dart';

class GradeCalculatorPage extends StatefulWidget {
  GradeCalculatorPage({Key? key}) : super(key: key);

  @override
  State<GradeCalculatorPage> createState() => _GradeCalculatorPageState();
}

class _GradeCalculatorPageState extends State<GradeCalculatorPage> {
  double selectedLetterValue = 4;

  double selectedCreditValue = 1;
  String selectedCourseName = '';
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Constants.mainColor.shade500,
        title: Center(
          child: Text(
            Constants.titleText,
            //  style: Constants.titleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                    flex: 1,
                    child: ShowAvarageGrade(
                      numoflessons: DataHelper.allAddedCourses.length,
                      avarage: DataHelper.calculateAvg(),
                    )),
              ],
            ),
          ),
          Expanded(
            child: CourseList(
              onDismiss: (index) {
                DataHelper.allAddedCourses.removeAt(index);
                setState(() {});
              },
            ),
          ),
          //list
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: Constants.horizontal8Padding,
              child: _buildTextFormField(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('Grade Letter', style: Constants.textStyle),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Credits',
                    style: Constants.textStyle,
                    textAlign: TextAlign.start,
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: Constants.horizontal8Padding,
                    child: LetterDropdownWidget(
                      onLetterSelected: (letter) {
                        selectedLetterValue = letter;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: Constants.horizontal8Padding,
                    child: CreditDropdownWidget(
                      onCreditSelected: (credit) {
                        selectedCreditValue = credit;
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _Calculate,
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Constants.mainColor.shade800,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            )
          ],
        ));
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          selectedCourseName = value!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Please enter a course name';
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: 'e.g. Math',
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.indigo.shade100.withOpacity(0.5)),
    );
  }

  void _Calculate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var addedCourse = Course(
          name: selectedCourseName,
          letterValue: selectedLetterValue,
          creditValue: selectedCreditValue);
      DataHelper.addCourse(addedCourse);
      setState(() {});
    }
  }
}
