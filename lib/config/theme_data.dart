import 'package:flutter/material.dart';
import 'package:machinetest/config/color_const.dart';

class CustomThemeData {
  static const appBarTheme = AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: kSecondaryColor,
      textTheme: TextTheme(
        headline6: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            fontFamily: 'Poppins',
            color: Colors.white),
      ));

  static const textTheme = TextTheme(
    headline2: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
    headline3: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    bodyText1: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
    bodyText2: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
  );
}
