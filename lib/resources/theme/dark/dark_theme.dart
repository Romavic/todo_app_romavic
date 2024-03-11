import 'package:flutter/material.dart';
import 'package:todo_app_romavic/resources/theme/dark/styles/appbar_theme_dark.dart';
import 'package:todo_app_romavic/resources/theme/dark/styles/floating_action_button_theme.dart';
import 'package:todo_app_romavic/resources/theme/dark/styles/icon_theme_dark.dart';
import 'package:todo_app_romavic/resources/theme/dark/styles/input_decoration_theme_dark.dart';
import 'package:todo_app_romavic/resources/theme/dark/styles/list_tile_theme_dark.dart';
import 'package:todo_app_romavic/resources/theme/dark/styles/text_button_theme_dark.dart';
import 'package:todo_app_romavic/resources/theme/dark/styles/text_theme_dark.dart';

ThemeData darkTheme = ThemeData.dark(
  useMaterial3: false,
).copyWith(
  scaffoldBackgroundColor: const Color(0xFF1c1c1c),
  cardColor: Colors.white,
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: Colors.grey.shade200,
  ),
  dialogBackgroundColor: Colors.white,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.black,
    onPrimary: Colors.black,
    secondary: Colors.black,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.red,
    background: Colors.grey.shade200,
    onBackground: Colors.grey.shade200,
    surface: Colors.blue,
    onSurface: Colors.white,
    onTertiaryContainer: Colors.white,
    scrim: Colors.black,
  ),
  appBarTheme: appbarThemeDark,
  iconTheme: iconThemeDark,
  textTheme: textThemeDark,
  textButtonTheme: textButtonThemeDark,
  inputDecorationTheme: inputDecorationThemeDark,
  floatingActionButtonTheme: floatingActionButtonThemeDark,
  listTileTheme: listTileThemeDark,
  popupMenuTheme: const PopupMenuThemeData(
    color: Color(0xFF1c1c1c),
  ),
);
