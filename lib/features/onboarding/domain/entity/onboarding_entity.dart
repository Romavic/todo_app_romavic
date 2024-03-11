import 'package:hive/hive.dart';

part 'onboarding_entity.g.dart';

@HiveType(typeId: 1)
class OnboardingEntity extends HiveObject {
  @HiveField(1)
  String? userId;

  OnboardingEntity({
    this.userId,
  });
}
