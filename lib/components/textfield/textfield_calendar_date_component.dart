import 'package:flutter/material.dart';
import 'package:todo_app_romavic/core/helpers/date/date_helper.dart';

enum CalendarPickerType {
  SELECT_ONLY_ONE_DAY,
  SELECT_DATE_RANGE,
}

class TextFieldCalendarDateComponent extends StatelessWidget {
  final FormFieldValidator? validator;
  final String? hint;
  final int? maxLength;
  final DateHelper dateHelper;
  final ValueNotifier<TextEditingController> selectDate;
  final Widget? prefixIcon;
  final CalendarPickerType datePickerType;

  const TextFieldCalendarDateComponent({
    super.key,
    this.validator,
    this.hint,
    this.maxLength,
    this.prefixIcon,
    required this.dateHelper,
    required this.selectDate,
    required this.datePickerType,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingController>(
      valueListenable: selectDate,
      builder: (context, selectedCategory, _) {
        return TextFormField(
          enabled: true,
          readOnly: true,
          controller: TextEditingController(text: selectDate.value.text),
          onTap: () {
            switch (datePickerType) {
              case CalendarPickerType.SELECT_ONLY_ONE_DAY:
                {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 10),
                  ).then(
                    (value) {
                      selectDate.value.text =
                          dateHelper.getDateWithOrWithoutRange(
                        context,
                        DateTime.parse(value.toString()),
                        DateTime.parse(value.toString()),
                      );
                    },
                  );
                }
              case CalendarPickerType.SELECT_DATE_RANGE:
                {
                  showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 10),
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                  ).then(
                    (value) {
                      selectDate.value.text =
                          dateHelper.getDateWithOrWithoutRange(
                        context,
                        DateTime.parse("${value?.start}"),
                        DateTime.parse("${value?.end}"),
                      );
                    },
                  );
                }
            }
          },
          maxLines: 20,
          minLines: 1,
          obscureText: false,
          keyboardType: TextInputType.datetime,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
          ),
        );
      },
    );
  }
}
