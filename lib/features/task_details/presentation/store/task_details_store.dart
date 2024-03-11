import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app_romavic/core/helpers/date/date_helper.dart';
import 'package:todo_app_romavic/features/task_details/domain/repository/task_details_repository.dart';

part 'task_details_store.g.dart';

class TaskDetailsStore = TaskDetailsBase with _$TaskDetailsStore;

abstract class TaskDetailsBase with Store {
  final TaskDetailsRepository taskDetailsRepository;
  final DateHelper dateHelper;

  TaskDetailsBase({
    required this.taskDetailsRepository,
    required this.dateHelper,
  });

  Future<void> changeTaskState(
    dynamic key,
    int index,
    bool state,
  ) async {
    taskDetailsRepository.changeTaskState(key, index, state);
  }

  Future<void> deleteTask(key, Function onDelete) async {
    taskDetailsRepository.deleteTask(key).whenComplete(() => onDelete());
  }

  String dateTime(BuildContext context, DateTime dateTime) {
    return "${dateHelper.getDate(context, dateTime)} - ${dateHelper.getTime(context, dateTime)}";
  }
}
