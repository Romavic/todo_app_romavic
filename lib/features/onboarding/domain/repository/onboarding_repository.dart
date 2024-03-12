import 'package:dartz/dartz.dart';

abstract class OnboardingRepository {
  Future<Either<String, String>> loginGoogleAccount();
}
