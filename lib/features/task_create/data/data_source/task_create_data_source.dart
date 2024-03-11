import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app_romavic/features/task_create/data/dto/request/task_create_request.dart';

abstract class TaskCreateDataSource {
  Future<Either<String, FirebaseException>> postTaskCreate({
    required TaskCreateRequest request,
  });
}
