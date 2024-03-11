import 'package:hive/hive.dart';
import 'package:todo_app_romavic/core/database/hive/tables_names.dart';
import 'package:todo_app_romavic/features/onboarding/domain/entity/onboarding_entity.dart';

bool get hasOnboardingData {
  return Hive.box<OnboardingEntity>(onboardingTable).values.isNotEmpty;
}
