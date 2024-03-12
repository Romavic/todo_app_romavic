import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/todo/presentation/state/todo_store.dart';

Future<void> todoDI() async {
  getIt.registerLazySingleton(
    () => TodoStore(
      dateHelper: getIt.get(),
      todoRepository: getIt.get(),
    ),
  );
}
