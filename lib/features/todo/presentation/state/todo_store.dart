import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app_romavic/core/helpers/date/date_helper.dart';
import 'package:todo_app_romavic/core/helpers/string_extension.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';
import 'package:todo_app_romavic/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_app_romavic/features/todo/utils/task_extension.dart';

part 'todo_store.g.dart';

class TodoStore = TodoStoreBase with _$TodoStore;

abstract class TodoStoreBase with Store {
  final TodoRepository todoRepository;
  final DateHelper dateHelper;

  TodoStoreBase({
    required this.todoRepository,
    required this.dateHelper,
  });

  @observable
  DateTime? currentDate = DateTime.now();

  @observable
  ObservableList<TaskEntity> tasksObservable = ObservableList.of([]);

  @observable
  ObservableList<TaskEntity> copyTasksObservable = ObservableList.of([]);

  @action
  Future<void> changeCurrentMonthAndYearByCalendar(
    DateTime newData,
    List<TaskEntity> tasks,
  ) async {
    currentDate = newData;
    tasksObservable = ObservableList.of(tasks.filterByDay(newData));
  }

  @action
  Future<void> addTasks(List<TaskEntity> tasks) async {
    tasksObservable.clear();
    copyTasksObservable.clear();
    tasksObservable = ObservableList.of(tasks);
    copyTasksObservable = ObservableList.of(tasks);
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

  int streaksDay(
    List<TaskEntity>? tasks,
    DateTime currentDate,
  ) {
    return todoRepository.getStreaksDay(tasks, currentDate);
  }

  int streaksDayCompleted(
    List<TaskEntity>? tasks,
    DateTime currentDate,
  ) {
    return todoRepository.getStreaksDayCompleted(
      tasks,
      currentDate,
    );
  }
}
