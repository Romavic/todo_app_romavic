import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

DatePickerThemeData datePickerThemeData = DatePickerThemeData(
  backgroundColor: Colors.black,
  headerBackgroundColor: Colors.black,
  headerHeadlineStyle: GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.black,
  ),
  dayStyle: GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.black,
  ),
  yearStyle: GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.black,
  ),
  confirmButtonStyle: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
        side: BorderSide.none,
      ),
    ),
  ),
  cancelButtonStyle: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
        side: BorderSide.none,
      ),
    ),
  ),
);
