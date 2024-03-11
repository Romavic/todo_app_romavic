import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_romavic/core/database/hive/tables_names.dart';
import 'package:todo_app_romavic/features/onboarding/domain/entity/onboarding_entity.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';

ValueListenable<Box<OnboardingEntity>> get onboardingListenable {
  return Hive.box<OnboardingEntity>(onboardingTable).listenable();
}

ValueListenable<Box<TaskEntity>> get taskListenable {
  return Hive.box<TaskEntity>(taskTable).listenable();
}
