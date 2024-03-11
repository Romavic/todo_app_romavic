import 'package:hive/hive.dart';
import 'package:todo_app_romavic/features/onboarding/domain/entity/onboarding_entity.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';

Future<void> registerAdapters() async {
  ///TypeId 1
  Hive.registerAdapter(OnboardingEntityAdapter());

  ///TypeId 2
  Hive.registerAdapter(TaskEntityAdapter());

  ///TypeId 3
  Hive.registerAdapter(StreakTaskEntityAdapter());

  ///TypeId 5
  Hive.registerAdapter(FrequencyEnumAdapter());
}
