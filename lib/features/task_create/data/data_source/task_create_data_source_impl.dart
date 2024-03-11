import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app_romavic/core/services/firebase/firebase_firestore_services.dart';
import 'package:todo_app_romavic/features/task_create/data/data_source/task_create_data_source.dart';
import 'package:todo_app_romavic/features/task_create/data/dto/request/task_create_request.dart';

class TaskCreateDataSourceImpl implements TaskCreateDataSource {
  final FirebaseFirestoreServices firebaseFirestoreServices;

  TaskCreateDataSourceImpl({
    required this.firebaseFirestoreServices,
  });

  @override
  Future<Either<String, FirebaseException>> postTaskCreate({
    required TaskCreateRequest request,
  }) async {
    try {
      return await firebaseFirestoreServices
          .postDataOnCollection(
            collectionName: "tasks",
            data: request.toJson(),
          )
          .then(
            (value) => Left(value.id),
          );
    } on FirebaseException catch (exception) {
      return Right(exception);
    }
  }
}
