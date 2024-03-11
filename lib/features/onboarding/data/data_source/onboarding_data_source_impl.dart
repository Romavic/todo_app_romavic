import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app_romavic/core/services/firebase/firebase_firestore_services.dart';
import 'package:todo_app_romavic/features/onboarding/data/data_source/onboarding_data_source.dart';

class OnboardingDataSourceImpl implements OnboardingDataSource {
  final FirebaseFirestoreServices firebaseFirestoreServices;

  OnboardingDataSourceImpl({required this.firebaseFirestoreServices});

  @override
  Future<Either<String, FirebaseException>> postAccountUserRegister({
    required Map<String, dynamic> bodyRequest,
  }) async {
    try {
      return await firebaseFirestoreServices
          .postDataOnCollection(
            collectionName: "users",
            data: bodyRequest,
          )
          .then(
            (value) => Left(value.id),
          );
    } on FirebaseException catch (exception) {
      return Right(exception);
    }
  }
}
