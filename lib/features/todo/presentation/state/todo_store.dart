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

  @action
  Future<void> changeCurrentMonthAndYearByCalendar(DateTime newData) async {
    currentDate = newData;
    tasksObservable = ObservableList.of(
      tasksObservable.filterByDay(currentDate ?? DateTime.now()),
    );
  }

  @action
  Future<void> addTasks(List<TaskEntity> tasks) async {
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

  int streaksDay(List<TaskEntity>? tasks) {
    return todoRepository.getStreaksDay(tasks);
  }
}
