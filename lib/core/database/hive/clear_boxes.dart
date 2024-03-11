import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_romavic/features/onboarding/domain/entity/onboarding_entity.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';

class ClearBoxes {
  final Box<OnboardingEntity> onboardingBox;
  final Box<TaskEntity> taskCreateBox;

  ClearBoxes({
    required this.onboardingBox,
    required this.taskCreateBox,
  });

  Future<void> clean() async {
    onboardingBox.clear();
    taskCreateBox.clear();
  }
}
