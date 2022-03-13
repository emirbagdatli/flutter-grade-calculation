import 'package:flutter/material.dart';
import 'package:flutter_grade_calculation_app/constants/app_constants.dart';
import 'package:flutter_grade_calculation_app/helper/data_helper.dart';

class LetterDropdownWidget extends StatefulWidget {
  final Function onLetterSelected;

  LetterDropdownWidget({required this.onLetterSelected, Key? key})
      : super(key: key);

  @override
  State<LetterDropdownWidget> createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectedLetterValue = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<double>(
        value: selectedLetterValue,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (selected) {
          setState(() {
            selectedLetterValue = selected!;
            widget.onLetterSelected(selectedLetterValue);
          });
        },
        underline: Container(),
        items: DataHelper.allLetterGrades(),
      ),
    );
  }
}
