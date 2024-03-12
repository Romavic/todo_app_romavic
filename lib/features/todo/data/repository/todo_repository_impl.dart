import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';
import 'package:todo_app_romavic/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_app_romavic/features/todo/utils/task_extension.dart';

class TodoRepositoryImpl implements TodoRepository {
  final Box<TaskEntity> taskBox;

  TodoRepositoryImpl({
    required this.taskBox,
  });

  @override
  int getStreaksDay(List<TaskEntity>? tasks) {
    if (tasks?.isEmpty == true || tasks == null) {
      return 100;
    } else {
      return tasks.getStreaksDay();
    }
  }

  @override
  int getStreaksDayCompleted(List<TaskEntity>? tasks) {
    if (tasks?.isEmpty == true || tasks == null) {
      return 0;
    } else {
      return tasks.getStreaksDayCompleted();
    }
  }

  @override
  int getStreaksWeek(
    List<TaskEntity>? tasks,
    DateTime initDate,
    DateTime endDate,
  ) {
    if (tasks?.isEmpty == true || tasks == null) {
      return 100;
    } else {
      return tasks.filterStreaksInRange(initDate, endDate);
    }
  }

  @override
  int getStreaksWeekCompleted(
    List<TaskEntity>? tasks,
    DateTime initDate,
    DateTime endDate,
  ) {
    if (tasks?.isEmpty == true || tasks == null) {
      return 0;
    } else {
      return tasks.filterIncompleteStreaksInRange(initDate, endDate);
    }
  }
}
