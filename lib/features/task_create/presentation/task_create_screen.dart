import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_romavic/components/buttons/button_text_with_loader_component.dart';
import 'package:todo_app_romavic/components/textfield/textfield_time_component.dart';
import 'package:todo_app_romavic/core/helpers/keyboard.dart';
import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/extra/task_create_extra.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';
import 'package:todo_app_romavic/features/task_create/presentation/state_management/task_create_store.dart';
import 'package:todo_app_romavic/resources/colors.dart';
import 'package:weekday_selector/weekday_selector.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({
    super.key,
    required this.taskCreateExtra,
  });

  final TaskCreateExtra taskCreateExtra;

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  final store = getIt.get<TaskCreateStore>();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController detailsController;
  late ValueNotifier<DateTime> showTime12hPicker;

  @override
  void initState() {
    titleController = TextEditingController(text: "");
    detailsController = TextEditingController(text: "");
    showTime12hPicker = ValueNotifier<DateTime>(DateTime.now());
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    detailsController.dispose();
    showTime12hPicker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Create"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4.0),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(hintText: "Title"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Fill title";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: detailsController,
                      decoration: const InputDecoration(hintText: "Details"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Fill details";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      enabled: true,
                      readOnly: true,
                      initialValue: store.getDateFormatted(
                        context,
                        widget.taskCreateExtra.startDate ?? DateTime.now(),
                        widget.taskCreateExtra.endDate ?? DateTime.now(),
                      ),
                      decoration: const InputDecoration(hintText: "Details"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Fill details";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text("Time"),
                    TextFieldTimeComponent(
                      hint: "Time",
                      dateHelper: store.dateHelper,
                      selectDate: showTime12hPicker,
                      prefixIcon: const Icon(CupertinoIcons.clock),
                      onDateChanged: (date) {
                        showTime12hPicker = ValueNotifier<DateTime>(date);
                      },
                      datePickerType: DatePickerType.showTime12hPicker,
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: widget.taskCreateExtra.frequencyEnum ==
                          FrequencyEnum.WEEKLY,
                      child: Observer(
                        builder: (_) {
                          return WeekdaySelector(
                            fillColor: primaryColor,
                            selectedFillColor: primaryColor,
                            disabledFillColor: Colors.black,
                            disabledColor: Colors.black,



                            selectedTextStyle:
                                Theme.of(context).textTheme.titleLarge!.apply(
                                      color: Colors.white,
                                    ),
                            disabledTextStyle:
                                Theme.of(context).textTheme.titleLarge!.apply(
                                      color: Colors.white,
                                    ),
                            onChanged: (int day) {
                              store.toggleDay(day);
                              printIntAsDay(day);
                            },
                            values: List<bool?>.from(store.preferredWeekdays),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ButtonTextWithLoaderComponent(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  hideKeyboard();
                  store.taskCreate(
                    title: titleController.text.toString(),
                    details: detailsController.text.toString(),
                    time: showTime12hPicker.value,
                    initDate:
                        widget.taskCreateExtra.startDate ?? DateTime.now(),
                    endDate: widget.taskCreateExtra.endDate ?? DateTime.now(),
                    frequencyEnum: widget.taskCreateExtra.frequencyEnum ??
                        FrequencyEnum.DAILY,
                    onComplete: () => context.pop(),
                  );
                }
              },
              state: false,
              message: "Create Task",
            ),
          ),
        ],
      ),
    );
  }

  printIntAsDay(int day) {
    print(
      'Received integer: $day. Corresponds to day: ${intDayToEnglish(day)}',
    );
  }

  String intDayToEnglish(int day) {
    if (day % 7 == DateTime.monday % 7) return 'Monday';
    if (day % 7 == DateTime.tuesday % 7) return 'Tueday';
    if (day % 7 == DateTime.wednesday % 7) return 'Wednesday';
    if (day % 7 == DateTime.thursday % 7) return 'Thursday';
    if (day % 7 == DateTime.friday % 7) return 'Friday';
    if (day % 7 == DateTime.saturday % 7) return 'Saturday';
    if (day % 7 == DateTime.sunday % 7) return 'Sunday';
    throw '🐞 This should never have happened: $day';
  }
}
