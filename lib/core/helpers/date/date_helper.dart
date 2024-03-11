import 'package:flutter/material.dart';

abstract class DateHelper {
  String? getLanguageTag(BuildContext context);

  String getDayMonthYearExtendedWithoutHourAndMinute(
    BuildContext context,
    DateTime dateTime,
  );

  String getDayMonthYearExtendedWithHourAndMinute(
    BuildContext context,
    DateTime dateTime,
  );

  String getTime(
    BuildContext context,
    DateTime dateTime,
  );

  String getDate(
    BuildContext context,
    DateTime dateTime,
  );

  String getDateWithOrWithoutRange(
    BuildContext context,
    DateTime initDate,
    DateTime endDate,
  );
}
