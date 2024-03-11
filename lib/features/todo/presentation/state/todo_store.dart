import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app_romavic/core/helpers/date/date_helper.dart';
import 'package:todo_app_romavic/core/helpers/string_extension.dart';
import 'package:alarm/alarm.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';
import 'package:todo_app_romavic/features/todo/utils/task_extension.dart';

part 'todo_store.g.dart';

class TodoStore = TodoStoreBase with _$TodoStore;

abstract class TodoStoreBase with Store {
  final DateHelper dateHelper;

  TodoStoreBase({
    required this.dateHelper,
  });

  @observable
  DateTime? currentDate = DateTime.now();

  @action
  Future<void> changeCurrentMonthAndYearByCalendar(DateTime newData) async {
    currentDate = newData;
  }

  String? localeOfCalendar(BuildContext context) {
    return dateHelper.getLanguageTag(context);
  }

  String? getCurrentMonthAndYearByCalendar(BuildContext context) {
    String? dateFormatted = dateHelper.getDate(
      context,
      currentDate ?? DateTime.now(),
    );
    return dateFormatted.toUpperCaseFirstLetter();
  }

  @action
  Future<void> scheduleAlarm(
    String title,
    String details,
    DateTime dateTime,
  ) async {
    final alarmSettings = AlarmSettings(
      id: 42,
      dateTime: dateTime,
      assetAudioPath: 'assets/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      volume: 0.8,
      fadeDuration: 3.0,
      notificationTitle: 'This is the title',
      notificationBody: 'This is the body',
      androidFullScreenIntent: true,
      enableNotificationOnKill: true,
    );

    await Alarm.set(alarmSettings: alarmSettings);
  }

  int? getStreaksDay(List<TaskEntity>? taskEntity) {
    if (taskEntity?.getStreaksDay() == null ||
        taskEntity?.getStreaksDay() == 0) {
      return 100;
    } else {
      return taskEntity?.getStreaksDay();
    }
  }



  int? getStreaksDayCompleted(List<TaskEntity>? taskEntity) {
 /*   int streaksDayCompleted = 100 / taskEntity?.getStreaksDayCompleted().toDouble();
    if (taskEntity?.getStreaksDayCompleted() == null ||
        taskEntity?.getStreaksDayCompleted() == 0) {
      return 0;
    } else {
      return taskEntity?.getStreaksDay();
    }*/
  }
}
