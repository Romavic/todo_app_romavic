import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:todo_app_romavic/components/calendar/agenda_component.dart';
import 'package:todo_app_romavic/components/cards/task_title_with_subtitle_component.dart';
import 'package:todo_app_romavic/components/dialogs/adaptive_dialog_component.dart';
import 'package:todo_app_romavic/components/information_component.dart';
import 'package:todo_app_romavic/core/database/hive/listenable_boxes.dart';
import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/extra/task_create_extra.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';
import 'package:todo_app_romavic/features/task_details/domain/extras/task_details_extras.dart';
import 'package:todo_app_romavic/features/todo/presentation/state/todo_store.dart';
import 'package:todo_app_romavic/features/todo/utils/task_extension.dart';
import 'package:todo_app_romavic/navigation/names_navigation.dart';
import 'package:todo_app_romavic/resources/illustrations.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final store = getIt.get<TodoStore>();

  @override
  void initState() {
    NotificationPermissions.requestNotificationPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Todo - App".toUpperCase()),
        actions: [
          IconButton(
            onPressed: () {
              showChoiceTypeFrequencyTaskDialog();
            },
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            Observer(
              builder: (_) {
                return AgendaComponent(
                  locale: store.localeOfCalendar(context),
                  focusedDay: store.currentDate,
                  firstDay: DateTime(1975),
                  lastDay: DateTime(DateTime.now().year + 5, 12, 31),
                  onPageChanged: (DateTime focusedDay) {
                    store.changeCurrentMonthAndYearByCalendar(focusedDay);
                  },
                  onDaySelected: (
                    DateTime selectedDay,
                    DateTime focusedDay,
                  ) {
                    store.changeCurrentMonthAndYearByCalendar(selectedDay);
                  },
                );
              },
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.only(
                top: 0.0,
                bottom: 10.0,
                left: 14,
                right: 14,
              ),
              child: Observer(
                builder: (_) {
                  return Text(
                    "Tasks ${store.getCurrentMonthAndYearByCalendar(context)}",
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                },
              ),
            ),
            /*  Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                left: 14,
                right: 14,
              ),
              child: ValueListenableBuilder<Box<TaskEntity>>(
                valueListenable: taskListenable,
                builder: (context, box, _) {
                  List<TaskEntity> taskEntity = box.values.toList();

                  return StepProgressIndicator(
                    totalSteps: taskEntity.getStreaksDay(),
                    currentStep: taskEntity.getStreaksDayCompleted(),
                    size: 10,
                    padding: 0,
                    selectedColor: const Color(0xff002E82),
                    unselectedColor: Colors.black12,
                    roundedEdges: Radius.zero,
                  );
                },
              ),
            ),*/
            Expanded(
              child: ValueListenableBuilder<Box<TaskEntity>>(
                valueListenable: taskListenable,
                builder: (context, box, _) {
                  store.addTasks(box.values.toList());

                  return Observer(
                    builder: (_) {
                      if (store.tasksObservable.isEmpty) {
                        return InformationComponent(
                          imageSvg: addNotesIllustrations,
                          text: "without notes",
                        );
                      } else {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: store.tasksObservable.length,
                          itemBuilder: (context, index) {
                            var taskEntity = store.tasksObservable[index];
                            return TaskTitleWithSubtitleComponent(
                              title: taskEntity.title.toString(),
                              details: taskEntity.details.toString(),
                              isDone: taskEntity.isTaskComplete ?? false,
                              onChanged: (bool? value) {},
                              onTap: () {
                                context.push(
                                  taskDetailsRoute,
                                  extra: TaskDetailsExtras(
                                    taskKey: taskEntity.key,
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Padding(
                              padding: EdgeInsets.only(
                                top: 0.0,
                                left: 15.0,
                                bottom: 0.0,
                                right: 15.0,
                              ),
                              child: Divider(color: Colors.black12),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showChoiceTypeFrequencyTaskDialog() async {
    adaptiveDialogComponent(
      context,
      title: 'What task frequency do you prefer ?',
      agreeLabel: "Daily",
      onAgreePressed: () {
        showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 10),
        ).then(
          (value) {
            context.push(
              taskCreateRoute,
              extra: TaskCreateExtra(
                frequencyEnum: FrequencyEnum.DAILY,
                startDate: value,
                endDate: value,
              ),
            );
          },
        );
      },
      cancelLabel: "Weekly",
      onCancelPressed: () {
        showDateRangePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 10),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        ).then(
          (value) {
            context.push(
              taskCreateRoute,
              extra: TaskCreateExtra(
                frequencyEnum: FrequencyEnum.WEEKLY,
                startDate: value?.start,
                endDate: value?.end,
              ),
            );
          },
        );
      },
    );
  }
}
