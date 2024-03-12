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
  Future<Either<String, String>> loginGoogleAccount() async {
    return await onboardingDataSource.getLoginWithGoogle().then(
      (value) {
        return value.fold(
          (userCredential) {
            onboardingDataSource.postUserOnCollection(bodyRequest: {
              "email": userCredential.user?.email,
              "name": userCredential.user?.displayName,
            });
            onboardingBox.add(
              OnboardingEntity(userId: userCredential.user?.uid),
            );
            return const Left("Success login account");
          },
          (firebaseAuthException) {
            return const Right("Error login account");
          },
        );
      },
    );
  }
}
