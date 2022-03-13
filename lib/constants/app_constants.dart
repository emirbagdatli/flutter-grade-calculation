// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.indigo;
  static const String titleText = 'Grade Calculator';
  /*static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);*/
  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final TextStyle gradecalcStyle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5);
  static final TextStyle avarageStyle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 46, color: mainColor.shade800);
  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static final horizontal8Padding = EdgeInsets.symmetric(horizontal: 8);

  static final TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Constants.mainColor.shade900.withOpacity(0.5));
}
