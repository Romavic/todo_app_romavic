import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';

abstract class TaskUpdateRepository {
  Future<void> taskUpdate({
    required dynamic key,
    required String title,
    required String details,
    required FrequencyEnum frequency,
    required DateTime time,
    required DateTime initDate,
    required DateTime endDate,
    required List<int> preferredWeekdays,
  });
}
