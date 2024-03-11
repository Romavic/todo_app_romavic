import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app_romavic/core/helpers/date/date_helper.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';
import 'package:todo_app_romavic/features/task_update/domain/repository/task_update_repository.dart';

part 'task_update_store.g.dart';

class TaskUpdateStore = TaskUpdateBase with _$TaskUpdateStore;

abstract class TaskUpdateBase with Store {
  final TaskUpdateRepository taskUpdateRepository;
  final DateHelper dateHelper;

  TaskUpdateBase({
    required this.taskUpdateRepository,
    required this.dateHelper,
  });

  Set<int> selectedPreferredWeekdays = {};

  @observable
  ObservableList<bool> preferredWeekdays = ObservableList.of(
    List<bool>.filled(7, true),
  );

  @action
  void toggleDay(int day) {
    final index = day % 7;
    preferredWeekdays[index] = !preferredWeekdays[index];

    if (selectedPreferredWeekdays.contains(index)) {
      selectedPreferredWeekdays.remove(index);
    } else {
      selectedPreferredWeekdays.add(index);
    }
  }

  String getDateFormatted(
    BuildContext context,
    DateTime startDate,
    DateTime endDate,
  ) {
    return dateHelper.getDateWithOrWithoutRange(
      context,
      startDate,
      endDate,
    );
  }

  @action
  Future<void> taskCreate({
    required dynamic key,
    required String title,
    required String details,
    required DateTime time,
    required DateTime initDate,
    required DateTime endDate,
    required FrequencyEnum frequencyEnum,
    required Function() onComplete,
  }) async {
    taskUpdateRepository
        .taskUpdate(
          key: key,
          title: title,
          details: details,
          frequency: frequencyEnum,
          time: time,
          initDate: initDate,
          endDate: endDate,
          preferredWeekdays: selectedPreferredWeekdays.toList(),
        )
        .whenComplete(
          () => onComplete(),
        );
  }
}
