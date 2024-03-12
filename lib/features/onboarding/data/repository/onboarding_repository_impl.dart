import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_romavic/features/onboarding/data/data_source/onboarding_data_source.dart';
import 'package:todo_app_romavic/features/onboarding/domain/entity/onboarding_entity.dart';
import 'package:todo_app_romavic/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:uuid/uuid.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingDataSource onboardingDataSource;
  final Box<OnboardingEntity> onboardingBox;
  final Uuid uuid;

  OnboardingRepositoryImpl({
    required this.onboardingDataSource,
    required this.onboardingBox,
    required this.uuid,
  });

  @override
  Future<void> loginApp() async {
    onboardingBox.add(
      OnboardingEntity(userId: uuid.v4()),
    );
  }
}
