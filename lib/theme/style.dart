import 'package:flutter/material.dart';

TextStyle textStyle = const TextStyle(
  color: const Color(0XFFFFFFFF),
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
  fontFamily: 'Graphie',
);

const double letterSpacingRhode = 4.0;

ThemeData appTheme = new ThemeData(
  primaryColor: primaryColor,
  hintColor: Colors.white,
  fontFamily: 'Graphie',
);

const Color primaryColor = const Color.fromRGBO(255, 204, 79, 1.0);
const Color secondaryColor = const Color.fromRGBO(255, 84, 73, 1.0);
const Color mutedColor = const Color.fromRGBO(179, 180, 179, 1.0);

const TextStyle titleStyle = const TextStyle(
  fontFamily: 'Rhode',
  letterSpacing: letterSpacingRhode,
  color: const Color(0XFFFFFFFF),
);

Color iconsAppbarColor = const Color(0xFFFFFFFF);

const TextStyle titleStyleBig = const TextStyle(
  fontFamily: 'Rhode',
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  letterSpacing: letterSpacingRhode,
  color: const Color(0XFFFFFFFF),
);

Color textFieldColor = const Color.fromRGBO(255, 255, 255, 0.1);

TextStyle buttonTextStyle = const TextStyle(
  color: const Color.fromRGBO(255, 255, 255, 0.8),
  fontSize: 14.0,
  fontFamily: "Graphie",
  fontWeight: FontWeight.w700
);
