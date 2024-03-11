import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_romavic/components/buttons/button_text_with_loader_component.dart';
import 'package:todo_app_romavic/components/textfield/textfield_time_component.dart';
import 'package:todo_app_romavic/core/helpers/keyboard.dart';
import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';
import 'package:todo_app_romavic/features/task_update/domain/entity/extra/task_update_extra.dart';
import 'package:todo_app_romavic/features/task_update/presentation/state_management/task_update_store.dart';
import 'package:weekday_selector/weekday_selector.dart';

class TaskUpdateScreen extends StatefulWidget {
  const TaskUpdateScreen({
    super.key,
    required this.taskUpdateExtra,
  });

  final TaskUpdateExtra taskUpdateExtra;

  @override
  State<TaskUpdateScreen> createState() => _TaskUpdateScreenState();
}

class _TaskUpdateScreenState extends State<TaskUpdateScreen> {
  final store = getIt.get<TaskUpdateStore>();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController detailsController;
  late ValueNotifier<DateTime> showTime12hPicker;

  @override
  void initState() {
    titleController = TextEditingController(
      text: widget.taskUpdateExtra.title,
    );
    detailsController = TextEditingController(
      text: widget.taskUpdateExtra.details,
    );
    showTime12hPicker = ValueNotifier<DateTime>(
      widget.taskUpdateExtra.time ?? DateTime.now(),
    );
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
        title: const Text("Task Update"),
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
                        widget.taskUpdateExtra.startDate ?? DateTime.now(),
                        widget.taskUpdateExtra.endDate ?? DateTime.now(),
                      ),
                      decoration: const InputDecoration(
                        hintText: "Details",
                      ),
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
                      visible: widget.taskUpdateExtra.frequencyEnum ==
                          FrequencyEnum.WEEKLY,
                      child: Observer(
                        builder: (_) {
                          return WeekdaySelector(
                            onChanged: (int day) {
                              store.toggleDay(day);
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
                    key: widget.taskUpdateExtra.key,
                    title: titleController.text.toString(),
                    details: detailsController.text.toString(),
                    time: showTime12hPicker.value,
                    initDate:
                        widget.taskUpdateExtra.startDate ?? DateTime.now(),
                    endDate: widget.taskUpdateExtra.endDate ?? DateTime.now(),
                    frequencyEnum: widget.taskUpdateExtra.frequencyEnum ??
                        FrequencyEnum.DAILY,
                    onComplete: () => context.pop(),
                  );
                }
              },
              state: false,
              message: "Update Task",
            ),
          ),
        ],
      ),
    );
  }
}
