import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_romavic/resources/colors.dart';

AppBarTheme appbarThemeLight = AppBarTheme(
  color: secondaryColor,
  elevation: 0,
  iconTheme: const IconThemeData(color: Colors.white),
  toolbarTextStyle: GoogleFonts.lato(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w900,
  ),
  titleTextStyle: GoogleFonts.lato(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w900,
  ),
);
