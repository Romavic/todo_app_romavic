import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app_romavic/core/database/hive/boxes_di.dart';
import 'package:todo_app_romavic/core/helpers/date/date_helper.dart';
import 'package:todo_app_romavic/core/helpers/date/date_helper_impl.dart';
import 'package:todo_app_romavic/core/services/firebase/firebase_firestore_services.dart';
import 'package:todo_app_romavic/core/services/firebase/firebase_firestore_services_impl.dart';
import 'package:todo_app_romavic/features/onboarding/di/onboarding_di.dart';
import 'package:todo_app_romavic/features/task_create/di/task_create_di.dart';
import 'package:todo_app_romavic/features/task_details/di/task_details_di.dart';
import 'package:todo_app_romavic/features/task_update/di/task_update_di.dart';
import 'package:todo_app_romavic/features/todo/di/todo_di.dart';
import 'package:uuid/uuid.dart';

GetIt getIt = GetIt.instance;

Future<void> dependenciesInjections() async {
  getIt.registerSingleton(
    FirebaseFirestore.instance,
  );

  getIt.registerSingleton<FirebaseFirestoreServices>(
    FirebaseFirestoreServicesImpl(
      firebaseFirestore: getIt.get(),
    ),
  );

  getIt.registerSingleton(
    const Uuid(),
  );

  getIt.registerSingleton<DateHelper>(
    DateHelperImpl(),
  );

  await boxesDI();
  await onboardingDI();
  await taskCreateDI();
  await todoDI();
  await daskDetailsDI();
  await taskUpdateDI();
}
