import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app_romavic/core/services/firebase/auth_firebase_services.dart';
import 'package:todo_app_romavic/core/services/firebase/firestore_firebase_services.dart';
import 'package:todo_app_romavic/features/onboarding/data/data_source/onboarding_data_source.dart';

class OnboardingDataSourceImpl implements OnboardingDataSource {
  final FirestoreFirebaseServices firebaseFirestoreServices;
  final AuthFirebaseServices authFirebaseServices;

  OnboardingDataSourceImpl({
    required this.firebaseFirestoreServices,
    required this.authFirebaseServices,
  });

  @override
  Future<Either<UserCredential, FirebaseAuthException>>
      getLoginWithGoogle() async {
    try {
      return await authFirebaseServices.getLoginWithGoogle().then(
        (value) {
          return Left(value);
        },
      );
    } on FirebaseAuthException catch (exception) {
      return Right(exception);
    }
  }

  @override
  Future<void> postUserOnCollection({
    required Map<String, dynamic> bodyRequest,
  }) async {
    await firebaseFirestoreServices.postDataOnCollection(
      collectionName: "users",
      data: bodyRequest,
    );
  }
}
