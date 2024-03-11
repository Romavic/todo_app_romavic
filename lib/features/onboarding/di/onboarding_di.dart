import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/onboarding/data/data_source/onboarding_data_source.dart';
import 'package:todo_app_romavic/features/onboarding/data/data_source/onboarding_data_source_impl.dart';
import 'package:todo_app_romavic/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:todo_app_romavic/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:todo_app_romavic/features/onboarding/presentation/state_management/onboarding_store.dart';

Future<void> onboardingDI() async {
  getIt.registerFactory<OnboardingDataSource>(
    () => OnboardingDataSourceImpl(firebaseFirestoreServices: getIt.get()),
  );

  getIt.registerFactory<OnboardingRepository>(
    () => OnboardingRepositoryImpl(
      onboardingDataSource: getIt.get(),
      onboardingBox: getIt.get(),
    ),
  );

  getIt.registerLazySingleton(
    () => OnboardingStore(
      onboardingRepository: getIt.get(),
    ),
  );
}
