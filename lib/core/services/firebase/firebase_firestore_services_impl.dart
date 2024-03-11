import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_romavic/core/services/firebase/firebase_firestore_services.dart';

class FirebaseFirestoreServicesImpl implements FirebaseFirestoreServices {
  final FirebaseFirestore firebaseFirestore;

  FirebaseFirestoreServicesImpl({
    required this.firebaseFirestore,
  });

  @override
  Future<CollectionReference> postCollection({
    required String collectionName,
  }) async {
    return firebaseFirestore.collection(collectionName);
  }

  @override
  Future<DocumentReference> postDataOnCollection({
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    return await firebaseFirestore.collection(collectionName).add(data);
  }

  @override
  Future<void> putDataOnCollection({
    required String collectionName,
    required String idPath,
    required Map<String, dynamic> data,
  }) async {
    return await firebaseFirestore
        .collection(collectionName)
        .doc(idPath)
        .update(data);
  }

  @override
  Future<QuerySnapshot> getDataOnCollection({
    required String collectionName,
    required String field,
    required String filteredParameter,
  }) async {
    return await firebaseFirestore
        .collection(collectionName)
        .where(field, isEqualTo: filteredParameter)
        .get(const GetOptions(source: Source.serverAndCache));
  }
}
