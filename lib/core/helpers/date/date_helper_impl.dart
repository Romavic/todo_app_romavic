import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_romavic/core/helpers/date/date_helper.dart';

class DateHelperImpl implements DateHelper {
  @override
  String? getLanguageTag(BuildContext context) {
    var tag = Localizations.maybeLocaleOf(context)?.toLanguageTag();
    return tag.toString();
  }

  @override
  String getDayMonthYearExtendedWithoutHourAndMinute(
    BuildContext context,
    DateTime dateTime,
  ) {
    final dateFormat = DateFormat('dd/MM/yy', getLanguageTag(context));
    final date = dateFormat.format(dateTime);
    return date;
  }

  @override
  String getDayMonthYearExtendedWithHourAndMinute(
    BuildContext context,
    DateTime dateTime,
  ) {
    final dateFormat = DateFormat('dd/MM/yy - HH:mm', getLanguageTag(context));
    final date = dateFormat.format(dateTime);
    return date;
  }

  @override
  String getTime(BuildContext context, DateTime dateTime) {
    final dateFormat = DateFormat('HH:mm', getLanguageTag(context));
    final date = dateFormat.format(dateTime);
    return date;
  }

  @override
  String getDate(BuildContext context, DateTime dateTime) {
    final dateFormat = DateFormat('dd/MM/yyyy', getLanguageTag(context));
    final date = dateFormat.format(dateTime);
    return date;
  }

  @override
  String getDateWithOrWithoutRange(
    BuildContext context,
    DateTime initDate,
    DateTime endDate,
  ) {
    final dateFormat = DateFormat('dd/MM/yy', getLanguageTag(context));

    bool isSameYear = initDate.year == endDate.year;
    bool isSameMonth = initDate.month == endDate.month;
    bool isSameDay = initDate.day == endDate.day;

    if (isSameYear && isSameMonth && isSameDay) {
      return dateFormat.format(initDate);
    } else {
      return "${dateFormat.format(initDate)} - ${dateFormat.format(endDate)}";
    }
  }
}
