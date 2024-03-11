import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class OnboardingDataSource {
  Future<Either<String, FirebaseException>> postAccountUserRegister({
    required Map<String, dynamic> bodyRequest,
  });
}
