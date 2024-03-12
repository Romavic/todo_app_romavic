import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_romavic/resources/colors.dart';
import 'package:todo_app_romavic/resources/theme/light/styles/appbar_theme_light.dart';
import 'package:todo_app_romavic/resources/theme/light/styles/date_picker_theme_light.dart';
import 'package:todo_app_romavic/resources/theme/light/styles/floating_action_button_theme_light.dart';
import 'package:todo_app_romavic/resources/theme/light/styles/icon_theme_light.dart';
import 'package:todo_app_romavic/resources/theme/light/styles/input_decoration_theme_light.dart';
import 'package:todo_app_romavic/resources/theme/light/styles/list_tile_theme_light.dart';
import 'package:todo_app_romavic/resources/theme/light/styles/text_button_theme_light.dart';
import 'package:todo_app_romavic/resources/theme/light/styles/text_theme_light.dart';

ThemeData lightTheme = ThemeData.dark(
  useMaterial3: false,
).copyWith(
  scaffoldBackgroundColor: Colors.grey.shade200,
  cardColor: Colors.black38,
  dialogBackgroundColor: Colors.white,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: Colors.black,
    secondary: Colors.black,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.red,
    background: Colors.grey.shade200,
    onBackground: Colors.grey.shade200,
    surface: Colors.red,
    onSurface: Colors.white,
    onTertiaryContainer: Colors.white,
    scrim: const Color(0xFFFFF6D6),
  ),
  appBarTheme: appbarThemeLight,
  iconTheme: iconThemeLight,
  textTheme: textThemeLight,
  textButtonTheme: textButtonThemeLight,
  inputDecorationTheme: inputDecorationThemeLight,
  floatingActionButtonTheme: floatingActionButtonThemeLight,
  listTileTheme: listTileThemeLight,
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStatePropertyAll(primaryColor),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: Colors.grey.shade200,
  ),
  datePickerTheme: datePickerThemeData,
);
