import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app_romavic/core/helpers/date/date_helper.dart';
import 'package:todo_app_romavic/core/helpers/string_extension.dart';
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

  @observable
  ObservableList<TaskEntity> tasksObservable = ObservableList.of([]);

  @action
  Future<void> changeCurrentMonthAndYearByCalendar(DateTime newData) async {
    currentDate = newData;
    tasksObservable = ObservableList.of(
      tasksObservable.filterByDay(currentDate ?? DateTime.now()),
    );
  }

  @action
  Future<void> addTasks(List<TaskEntity> tasks) async {
    debugPrint(currentDate.toString());

    tasksObservable.clear();
    tasksObservable = ObservableList.of(tasks);
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
