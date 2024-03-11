import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_romavic/components/buttons/button_text_with_loader_component.dart';
import 'package:todo_app_romavic/core/database/hive/listenable_boxes.dart';
import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';
import 'package:todo_app_romavic/features/task_details/domain/extras/task_details_extras.dart';
import 'package:todo_app_romavic/features/task_details/presentation/store/task_details_store.dart';
import 'package:todo_app_romavic/features/task_update/domain/entity/extra/task_update_extra.dart';
import 'package:todo_app_romavic/navigation/names_navigation.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({
    super.key,
    required this.taskDetailsExtras,
  });

  final TaskDetailsExtras taskDetailsExtras;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final store = getIt.get<TaskDetailsStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Task Details"),
      ),
      body: ValueListenableBuilder<Box<TaskEntity>>(
        valueListenable: taskListenable,
        builder: (context, box, _) {
          TaskEntity task = box.values.firstWhere(
            (element) => widget.taskDetailsExtras.taskKey == element.key,
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(task.title.toString()),
                const SizedBox(height: 20),
                Text(
                  "Details",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(task.details.toString()),
                const SizedBox(height: 20),
                Text(
                  "Task reminders",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Column(
                  children: List.generate(
                    task.streaks?.length ?? 0,
                    (index) => CheckboxListTile(
                      title: Text(
                        store.dateTime(
                          context,
                          task.streaks![index].dateTime ?? DateTime.now(),
                        ),
                      ),
                      value: task.streaks![index].isDone,
                      onChanged: (bool? value) {
                        store.changeTaskState(task.key, index, value ?? false);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ButtonTextWithLoaderComponent(
                    onPressed: () => updateDate(task),
                    state: false,
                    message: "Edit",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ButtonTextWithLoaderComponent(
                    onPressed: () {
                      store.deleteTask(task.key, () {});
                      context.pop();
                    },
                    state: false,
                    message: "Delete",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> updateDate(TaskEntity task) async {
    if (task.typeOfTask == FrequencyEnum.DAILY) {
      showDatePicker(
        context: context,
        initialDate: task.initDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 10),
      ).then(
        (value) {
          context.push(
            taskUpdateRoute,
            extra: TaskUpdateExtra(
              title: task.title,
              details: task.details,
              frequencyEnum: task.typeOfTask,
              time: task.streaks?.first.dateTime,
              startDate: value ?? DateTime.now(),
              endDate: value ?? DateTime.now(),
            ),
          );
        },
      );
    } else {
      showDateRangePicker(
        context: context,
        initialDateRange: DateTimeRange(
          start: task.initDate ?? DateTime.now(),
          end: task.endDate ?? DateTime.now(),
        ),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 10),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      ).then(
        (value) {
          context.push(
            taskUpdateRoute,
            extra: TaskUpdateExtra(
              key: task.key,
              title: task.title,
              details: task.details,
              frequencyEnum: task.typeOfTask,
              time: task.streaks?.isNotEmpty == true
                  ? task.streaks?.first.dateTime
                  : DateTime.now(),
              startDate: value?.start ?? DateTime.now(),
              endDate: value?.end ?? DateTime.now(),
            ),
          );
        },
      );
    }
  }
}
