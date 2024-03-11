import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app_romavic/core/helpers/date/date_helper.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';
import 'package:todo_app_romavic/features/task_create/domain/repository/task_create_repository.dart';

part 'task_create_store.g.dart';

class TaskCreateStore = TaskCreateBase with _$TaskCreateStore;

abstract class TaskCreateBase with Store {
  final TaskCreateRepository taskCreateRepository;
  final DateHelper dateHelper;

  TaskCreateBase({
    required this.taskCreateRepository,
    required this.dateHelper,
  });

  Set<int> selectedPreferredWeekdays = {};

  @observable
  ObservableList<bool> preferredWeekdays = ObservableList.of(
    List<bool>.filled(7, true),
  );

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
  void toggleDay(int day) {
    final index = day % 7;
    preferredWeekdays[index] = !preferredWeekdays[index];

    if (selectedPreferredWeekdays.contains(index)) {
      selectedPreferredWeekdays.remove(index);
    } else {
      selectedPreferredWeekdays.add(index);
    }
  }

  @action
  Future<void> taskCreate({
    required String title,
    required String details,
    required DateTime time,
    required DateTime initDate,
    required DateTime endDate,
    required FrequencyEnum frequencyEnum,
    required Function() onComplete,
  }) async {
    for (var value in selectedPreferredWeekdays.toList()) {
      debugPrint("selectedPreferredWeekdays $value");
      debugPrint(
          "selectedPreferredWeekdays ${selectedPreferredWeekdays.toList()}");
    }

    taskCreateRepository
        .taskCreate(
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
