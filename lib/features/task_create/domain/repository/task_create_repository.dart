import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';

abstract class TaskCreateRepository {
  Future<void> taskCreate({
    required String title,
    required String details,
    required FrequencyEnum frequency,
    required DateTime time,
    required DateTime initDate,
    required DateTime endDate,
    required List<int> preferredWeekdays,
  });
}
