import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_romavic/features/onboarding/domain/entity/onboarding_entity.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';
import 'package:todo_app_romavic/features/task_update/domain/repository/task_update_repository.dart';
import 'package:todo_app_romavic/resources/colors.dart';

class TaskUpdateRepositoryImpl implements TaskUpdateRepository {
  final Box<OnboardingEntity> onboardingBox;
  final Box<TaskEntity> taskCreateBox;

  TaskUpdateRepositoryImpl({
    required this.onboardingBox,
    required this.taskCreateBox,
  });

  @override
  Future<void> taskUpdate({
    required dynamic key,
    required String title,
    required String details,
    required FrequencyEnum frequency,
    required DateTime time,
    required DateTime initDate,
    required DateTime endDate,
    required List<int> preferredWeekdays,
  }) async {
    List<StreakTaskEntity> streaks = [];

    if (preferredWeekdays.isEmpty && frequency == FrequencyEnum.DAILY) {
      var year = initDate.year;
      var month = initDate.month;
      var day = initDate.day;
      var hour = time.hour;
      var minute = time.minute;
      var second = time.second;
      streaks.add(
        StreakTaskEntity(
          dateTime: DateTime(year, month, day, hour, minute, second),
          isDone: false,
        ),
      );
    } else {
      findMeetingDays(initDate, endDate, preferredWeekdays).forEach(
        (element) {
          var year = element.year;
          var month = element.month;
          var day = element.day;
          var hour = time.hour;
          var minute = time.minute;
          var second = time.second;
          streaks.add(
            StreakTaskEntity(
              dateTime: DateTime(year, month, day, hour, minute, second),
              isDone: false,
            ),
          );
        },
      );
    }

    taskCreateBox.put(
      key,
      TaskEntity(
        idUser: onboardingBox.values.first.userId,
        title: title,
        details: details,
        typeOfTask: frequency,
        isTaskComplete: false,
        initDate: initDate,
        endDate: endDate,
        streaks: streaks,
      ),
    );
  }

  List<DateTime> findMeetingDays(
    DateTime startDate,
    DateTime endDate,
    List<int> preferredWeekdays,
  ) {
    List<DateTime> meetingDays = [];

    if (startDate.isAfter(endDate)) {
      return meetingDays;
    }

    for (DateTime date = startDate;
        date.isBefore(endDate);
        date = date.add(const Duration(days: 1))) {
      if (preferredWeekdays.contains(date.weekday)) {
        meetingDays.add(date);
      }
    }
    return meetingDays;
  }
}
