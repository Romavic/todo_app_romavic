import 'package:flutter/material.dart';
import 'package:todo_app_romavic/resources/colors.dart';

TextButtonThemeData textButtonThemeLight = TextButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(secondaryColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
        side: BorderSide.none,
      ),
    ),
  ),
);
