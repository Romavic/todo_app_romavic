import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';

class TaskUpdateExtra {
  final dynamic key;
  final String? title;
  final String? details;
  final FrequencyEnum? frequencyEnum;
  final DateTime? time;
  final DateTime? startDate;
  final DateTime? endDate;

  TaskUpdateExtra({
    this.key,
    this.title,
    this.details,
    this.frequencyEnum,
    this.time,
    this.startDate,
    this.endDate,
  });
}
