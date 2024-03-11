import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ListTileThemeData listTileThemeLight = ListTileThemeData(
  minVerticalPadding: 0,
  minLeadingWidth: 0,
  horizontalTitleGap: 0,
  contentPadding: EdgeInsets.zero,
  style: ListTileStyle.list,
  titleTextStyle: GoogleFonts.lato(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: Colors.black,
  ),
  subtitleTextStyle: GoogleFonts.lato(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: Colors.black,
  ),
);
