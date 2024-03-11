import 'package:dartz/dartz_unsafe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';
import 'package:todo_app_romavic/features/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final Box<TaskEntity> taskBox;

  TodoRepositoryImpl({
    required this.taskBox,
  });

  @override
  int getStreaksDay() {
    List<StreakTaskEntity>? streaks = [];

    for (var element in taskBox.values) {
      element.streaks?.where(
        (element) {
          bool isSameYear = element.dateTime?.year == DateTime.now().year;
          bool isSameMonth = element.dateTime?.month == DateTime.now().month;
          bool isSameDay = element.dateTime?.day == DateTime.now().day;

          return isSameYear && isSameMonth && isSameDay;
        },
      ).forEach((streak) {
        streaks.add(streak);
      });
    }

    return streaks.length ?? 0;
  }
}
