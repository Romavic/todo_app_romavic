import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_romavic/core/database/hive/tables_names.dart';
import 'package:todo_app_romavic/features/onboarding/domain/entity/onboarding_entity.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';

Future<void> openBoxes() async {
  await Hive.openBox<OnboardingEntity>(onboardingTable);

  await Hive.openBox<TaskEntity>(taskTable);
}
