import 'package:flutter/material.dart';

TextButtonThemeData textButtonThemeDark = TextButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.blue),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
        side: BorderSide.none,
      ),
    ),
  ),
);
