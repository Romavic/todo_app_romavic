import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/task_details/data/repository/task_details_repository_impl.dart';
import 'package:todo_app_romavic/features/task_details/domain/repository/task_details_repository.dart';
import 'package:todo_app_romavic/features/task_details/presentation/store/task_details_store.dart';

Future<void> daskDetailsDI() async {
  getIt.registerFactory<TaskDetailsRepository>(
    () => TaskDetailsRepositoryImpl(
      taskCreateBox: getIt.get(),
    ),
  );

  getIt.registerLazySingleton(
    () => TaskDetailsStore(
      dateHelper: getIt.get(),
      taskDetailsRepository: getIt.get(),
    ),
  );
}
