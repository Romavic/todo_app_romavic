import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/task_create/data/data_source/task_create_data_source.dart';
import 'package:todo_app_romavic/features/task_create/data/data_source/task_create_data_source_impl.dart';
import 'package:todo_app_romavic/features/task_create/data/repository/task_create_repository_impl.dart';
import 'package:todo_app_romavic/features/task_create/domain/repository/task_create_repository.dart';
import 'package:todo_app_romavic/features/task_create/presentation/state_management/task_create_store.dart';

Future<void> taskCreateDI() async {
  getIt.registerFactory<TaskCreateDataSource>(
    () => TaskCreateDataSourceImpl(firebaseFirestoreServices: getIt.get()),
  );

  getIt.registerFactory<TaskCreateRepository>(
    () => TaskCreateRepositoryImpl(
      taskCreateDataSource: getIt.get(),
      onboardingBox: getIt.get(),
      taskCreateBox: getIt.get(),
    ),
  );

  getIt.registerLazySingleton(
    () => TaskCreateStore(
      taskCreateRepository: getIt.get(),
      dateHelper: getIt.get(),
    ),
  );
}
