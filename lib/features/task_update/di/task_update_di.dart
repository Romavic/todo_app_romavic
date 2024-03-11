import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/task_update/data/repository/task_update_repository_impl.dart';
import 'package:todo_app_romavic/features/task_update/domain/repository/task_update_repository.dart';
import 'package:todo_app_romavic/features/task_update/presentation/state_management/task_update_store.dart';

Future<void> taskUpdateDI() async {
  getIt.registerFactory<TaskUpdateRepository>(
    () => TaskUpdateRepositoryImpl(
      onboardingBox: getIt.get(),
      taskCreateBox: getIt.get(),
    ),
  );

  getIt.registerLazySingleton(
    () => TaskUpdateStore(
      taskUpdateRepository: getIt.get(),
      dateHelper: getIt.get(),
    ),
  );
}
