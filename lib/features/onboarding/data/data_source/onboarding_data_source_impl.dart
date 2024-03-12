import 'package:todo_app_romavic/core/services/firebase/firestore_firebase_services.dart';
import 'package:todo_app_romavic/features/onboarding/data/data_source/onboarding_data_source.dart';

class OnboardingDataSourceImpl implements OnboardingDataSource {
  final FirestoreFirebaseServices firebaseFirestoreServices;

  OnboardingDataSourceImpl({
    required this.firebaseFirestoreServices,
  });

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
