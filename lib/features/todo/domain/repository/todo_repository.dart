import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';

abstract class TodoRepository {
  int getStreaksDay(
    List<TaskEntity>? tasks,
  );

  int getStreaksDayCompleted(
    List<TaskEntity>? tasks,
  );

  int getStreaksWeek(
    List<TaskEntity>? tasks,
    DateTime initDate,
    DateTime endDate,
  );

  int getStreaksWeekCompleted(
    List<TaskEntity>? tasks,
    DateTime initDate,
    DateTime endDate,
  );
}
