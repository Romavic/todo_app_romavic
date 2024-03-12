import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/todo/data/repository/todo_repository_impl.dart';
import 'package:todo_app_romavic/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_app_romavic/features/todo/presentation/state/todo_store.dart';

Future<void> todoDI() async {
  getIt.registerFactory<TodoRepository>(
    () => TodoRepositoryImpl(
      taskBox: getIt.get(),
    ),
  );

  getIt.registerLazySingleton(
    () => TodoStore(
      dateHelper: getIt.get(),
      todoRepository: getIt.get(),
    ),
  );
}
