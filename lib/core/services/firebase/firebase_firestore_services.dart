import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseFirestoreServices {
  Future<CollectionReference> postCollection({
    required String collectionName,
  });

  Future<DocumentReference> postDataOnCollection({
    required String collectionName,
    required Map<String, dynamic> data,
  });

  Future<void> putDataOnCollection({
    required String collectionName,
    required String idPath,
    required Map<String, dynamic> data,
  });

  Future<QuerySnapshot> getDataOnCollection({
    required String collectionName,
    required String field,
    required String filteredParameter,
  });
}
