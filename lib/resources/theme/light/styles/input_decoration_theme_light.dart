import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_romavic/resources/colors.dart';

InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  prefixIconColor: Colors.black,
  labelStyle: GoogleFonts.lato(
    fontWeight: FontWeight.w600,
  ),
  hintStyle: GoogleFonts.lato(
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
  errorStyle: GoogleFonts.lato(
    fontWeight: FontWeight.w300,
    color: Colors.red,
  ),
  border: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  outlineBorder: const BorderSide(color: Colors.transparent),
  disabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  activeIndicatorBorder: const BorderSide(color: Colors.transparent),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
);
