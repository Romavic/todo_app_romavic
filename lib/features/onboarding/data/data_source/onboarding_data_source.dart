import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OnboardingDataSource {
  Future<Either<UserCredential, FirebaseAuthException>> getLoginWithGoogle();

  Future<void> postUserOnCollection({
    required Map<String, dynamic> bodyRequest,
  });
}
