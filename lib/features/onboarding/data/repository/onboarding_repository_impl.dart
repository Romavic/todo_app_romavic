import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_romavic/features/onboarding/data/data_source/onboarding_data_source.dart';
import 'package:todo_app_romavic/features/onboarding/domain/entity/onboarding_entity.dart';
import 'package:todo_app_romavic/features/onboarding/domain/repository/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingDataSource onboardingDataSource;
  final Box<OnboardingEntity> onboardingBox;

  OnboardingRepositoryImpl({
    required this.onboardingDataSource,
    required this.onboardingBox,
  });

  @override
  Future<Either<String, String>> accountUserRegister({
    required String name,
  }) async {
    return await onboardingDataSource.postAccountUserRegister(bodyRequest: {
      "name": name,
    }).then(
      (value) {
        return value.fold(
          (l) {
            onboardingBox.add(OnboardingEntity(userId: l));
            return Left(l);
          },
          (r) {
            return Right(r.message.toString());
          },
        );
      },
    );
  }
}
