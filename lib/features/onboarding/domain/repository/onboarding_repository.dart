import 'package:dartz/dartz.dart';

abstract class OnboardingRepository {
  Future<Either<String, String>> accountUserRegister({
    required String name,
  });
}
