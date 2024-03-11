import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';
import 'package:todo_app_romavic/features/task_details/domain/repository/task_details_repository.dart';

class TaskDetailsRepositoryImpl implements TaskDetailsRepository {
  final Box<TaskEntity> taskCreateBox;

  TaskDetailsRepositoryImpl({required this.taskCreateBox});

  @override
  Future<void> deleteTask(key) async {
    taskCreateBox.delete(key);
  }

  @override
  Future<void> changeTaskState(
    dynamic key,
    int index,
    bool state,
  ) async {
    TaskEntity? task = taskCreateBox.get(key);

    if (task?.streaks?.isNotEmpty == true) {
      if (index >= 0 && index < task!.streaks!.length) {
        TaskEntity updatedTask = TaskEntity(
          idUser: task.idUser,
          title: task.title,
          details: task.details,
          typeOfTask: task.typeOfTask,
          isTaskComplete: task.isTaskComplete,
          initDate: task.initDate,
          endDate: task.endDate,
          streaks: List<StreakTaskEntity>.from(task.streaks!),
        );

        updatedTask.streaks![index] = StreakTaskEntity(
          dateTime: DateTime.now(),
          isDone: state,
        );

        taskCreateBox.put(key, updatedTask);
      }
    }
  }
}
