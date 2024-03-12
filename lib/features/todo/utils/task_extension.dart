import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';

extension TaskExtension on Iterable<TaskEntity> {
  int getStreaksDay() {
    final currentDate = DateTime.now();

    return where((task) {
      return task.streaks?.any((streak) =>
              streak.dateTime?.year == currentDate.year &&
              streak.dateTime?.month == currentDate.month &&
              streak.dateTime?.day == currentDate.day) ??
          false;
    }).length;
  }

  int getStreaksDayCompleted() {
    final currentDate = DateTime.now();

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
    return where((task) =>
            task.streaks?.any((streak) => streak.dateTime == dateTime) ?? false)
        .toList();
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
                streakDate.isBefore(endDate);
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
                streak.isDone == false;
          }) ??
          false;
    }).length;
  }
}
