import 'package:flutter/material.dart';

class AppTheme {
  static const endBackgroundGradient = Color(0xFFFFCD52);
  static const startBackgroundGradient = Color(0xFFFFE5A5);
  static const lightGrey = Color(0xFFF0F2F6);
  static const mainText = Color(0xFF3A3A3A);
  static const blueGrey = Color(0xFF939DB1);
  static const lightBackground = Color(0xFFF5F7FB);
  static const mainAccent = Color(0xFF476ADB);

  static const buttonTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: mainAccent);

  static const normalTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: blueGrey);

  static const boldTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: mainText);
}
