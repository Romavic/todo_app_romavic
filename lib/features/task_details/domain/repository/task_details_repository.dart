abstract class TaskDetailsRepository {
  Future<void> deleteTask(dynamic key);

  Future<void> changeTaskState(dynamic key, int index, bool state);
}
