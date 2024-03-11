import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app_romavic/core/database/hive/listenable_boxes.dart';
import 'package:todo_app_romavic/core/helpers/string_extension.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';
import 'package:todo_app_romavic/resources/colors.dart';

class AgendaComponent extends StatelessWidget {
  const AgendaComponent({
    super.key,
    this.locale,
    required this.focusedDay,
    required this.firstDay,
    required this.lastDay,
    this.onDaySelected,
    this.onPageChanged,
  });

  final dynamic locale;
  final DateTime? focusedDay;
  final DateTime firstDay;
  final DateTime lastDay;
  final OnDaySelected? onDaySelected;
  final void Function(DateTime focusedDay)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TaskEntity>>(
      valueListenable: taskListenable,
      builder: (context, box, _) {
        List<StreakTaskEntity>? streaksOnBox = [];
        List<TaskEntity> task = box.values.toList();
        for (var element in task) {
          streaksOnBox.addAll(element.streaks ?? []);
        }

        return TableCalendar(
          locale: locale,
          onPageChanged: onPageChanged,
          startingDayOfWeek: StartingDayOfWeek.monday,
          shouldFillViewport: false,
          weekNumbersVisible: false,
          headerVisible: false,
          firstDay: firstDay,
          lastDay: lastDay,
          focusedDay: focusedDay ?? DateTime.now(),
          onDaySelected: onDaySelected,
          daysOfWeekVisible: true,
          calendarFormat: CalendarFormat.month,
          eventLoader: (day) {
            if (streaksOnBox.isNotEmpty) {
              var schedules = streaksOnBox.where(
                (scheduler) {
                  return isSameDay(
                    DateTime.tryParse(scheduler.dateTime.toString()),
                    day,
                  );
                },
              ).toList();
              return schedules;
            } else {
              return [];
            }
          },
          selectedDayPredicate: (day) {
            return isSameDay(focusedDay, day);
          },
          calendarStyle: CalendarStyle(
            markersAutoAligned: true,
            markerMargin: EdgeInsets.zero,
            markersAlignment: Alignment.bottomCenter,
            markerSize: 4,
            markersMaxCount: 1,
            selectedDecoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: Theme.of(context).textTheme.titleSmall!,
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            dowTextFormatter: (date, locale) {
              var dateFormatted = DateFormat.E(
                locale,
              ).format(date)[0];
              return dateFormatted.toUpperCaseFirstLetter();
            },
            weekdayStyle: Theme.of(context).textTheme.titleSmall!,
            weekendStyle: Theme.of(context).textTheme.titleSmall!,
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, date, events) {
              return Text(
                date.day.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              );
            },
            selectedBuilder: (context, date, events) {
              return Container(
                height: 22,
                width: 22,
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red.shade500,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  date.day.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              );
            },
            todayBuilder: (context, date, events) {
              return Container(
                height: 22,
                width: 22,
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: calendarColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  date.day.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Color defaultColor(BuildContext context) {
    return Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.1);
  }
}
