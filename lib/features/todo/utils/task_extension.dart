import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';

extension TaskExtension on Iterable<TaskEntity> {
  int getStreaksDay(DateTime currentDate) {
    return where((task) {
      return task.streaks?.any((streak) =>
              streak.dateTime?.year == currentDate.year &&
                  streak.dateTime?.month == currentDate.month &&
                  streak.dateTime?.day == currentDate.day &&
                  streak.isDone == true ||
              streak.isDone == false) ??
          false;
    }).length;
  }

  int getStreaksDayCompleted(DateTime currentDate) {
    return where((task) {
      return task.streaks?.any((streak) =>
              streak.dateTime?.year == currentDate.year &&
              streak.dateTime?.month == currentDate.month &&
              streak.dateTime?.day == currentDate.day &&
              streak.isDone == true) ??
          false;
    }).length;
  }

  List<TaskEntity> filterByDay(DateTime dateTime) {
    return where(
      (task) =>
          task.streaks?.any((streak) =>
              streak.dateTime?.year == dateTime.year &&
              streak.dateTime?.month == dateTime.month &&
              streak.dateTime?.day == dateTime.day) ??
          false,
    ).toList();
  }

  int filterStreaksInRange(
    DateTime initDate,
    DateTime endDate,
  ) {
    return where((task) {
      return task.streaks?.any((streak) {
            final streakDate = streak.dateTime;
            return streakDate != null &&
                    streakDate.isAfter(initDate) &&
                    streakDate.isBefore(endDate) &&
                    streak.isDone == true ||
                streak.isDone == false;
          }) ??
          false;
    }).length;
  }

  int filterIncompleteStreaksInRange(
    DateTime initDate,
    DateTime endDate,
  ) {
    return where((task) {
      return task.streaks?.any((streak) {
            final streakDate = streak.dateTime;
            return streakDate != null &&
                streakDate.isAfter(initDate) &&
                streakDate.isBefore(endDate) &&
                streak.isDone == true;
          }) ??
          false;
    }).length;
  }
}
