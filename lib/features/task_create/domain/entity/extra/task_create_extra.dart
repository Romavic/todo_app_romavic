import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';

class TaskCreateExtra {
  final FrequencyEnum? frequencyEnum;
  final DateTime? startDate;
  final DateTime? endDate;

  TaskCreateExtra({
    this.frequencyEnum,
    this.startDate,
    this.endDate,
  });
}
