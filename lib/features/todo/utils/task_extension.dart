import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';

extension TaskExtension on Iterable<TaskEntity> {
  int getStreaksDay() {
    List<StreakTaskEntity> streaks = [];

    for (var element in this) {
      element.streaks?.where(
        (element) {
          bool isSameYear = element.dateTime?.year == DateTime.now().year;
          bool isSameMonth = element.dateTime?.month == DateTime.now().month;
          bool isSameDay = element.dateTime?.day == DateTime.now().day;

          return isSameYear && isSameMonth && isSameDay;
        },
      ).forEach(
        (streak) {
          streaks.add(streak);
        },
      );
    }

    return streaks.length;
  }

  int getStreaksDayCompleted() {
    List<StreakTaskEntity> streaks = [];

    for (var element in this) {
      element.streaks?.where(
        (element) {
          bool isSameYear = element.dateTime?.year == DateTime.now().year;
          bool isSameMonth = element.dateTime?.month == DateTime.now().month;
          bool isSameDay = element.dateTime?.day == DateTime.now().day;
          bool isDone = element.isDone == true;
          return isSameYear && isSameMonth && isSameDay && isDone;
        },
      ).forEach(
        (streak) {
          streaks.add(streak);
        },
      );
    }

    return streaks.length;
  }

  List<TaskEntity> filterByDay(DateTime dateTime) {
    return where(
      (element) {
        return element.streaks?.any(
              (element) => element.dateTime == dateTime,
            ) ??
            false;
      },
    ).toList();
  }
}
