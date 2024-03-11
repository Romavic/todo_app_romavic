import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:todo_app_romavic/core/helpers/date/date_helper.dart';

enum DatePickerType {
  showDatePicker,
  showDateTimePicker,
  showTime12hPicker,
}

class TextFieldTimeComponent extends StatelessWidget {
  final FormFieldValidator? validator;
  final String? hint;
  final int? maxLength;
  final DateChangedCallback? onDateChanged;
  final DateHelper dateHelper;
  final ValueNotifier<DateTime?> selectDate;
  final Widget? prefixIcon;
  final DatePickerType datePickerType;

  const TextFieldTimeComponent({
    super.key,
    this.validator,
    this.hint,
    this.maxLength,
    this.onDateChanged,
    this.prefixIcon,
    required this.dateHelper,
    required this.selectDate,
    required this.datePickerType,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime?>(
      valueListenable: selectDate,
      builder: (context, selectedCategory, _) {
        return TextFormField(
          enabled: true,
          readOnly: true,
          onTap: () {
            switch (datePickerType) {
              case DatePickerType.showDatePicker:
                {
                  picker.DatePicker.showDatePicker(
                    context,
                    theme: picker.DatePickerTheme(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      cancelStyle: Theme.of(context).textTheme.titleMedium!,
                      doneStyle: Theme.of(context).textTheme.titleMedium!,
                      itemStyle: Theme.of(context).textTheme.titleMedium!,
                    ),
                    showTitleActions: true,
                    minTime: DateTime(1970),
                    maxTime: DateTime(DateTime.now().year + 1),
                    onChanged: onDateChanged,
                    currentTime: selectDate.value,
                    onConfirm: (date) {
                      selectDate.value = date;
                    },
                    locale: picker.LocaleType.pt,
                  );
                }
              case DatePickerType.showDateTimePicker:
                {
                  picker.DatePicker.showDateTimePicker(
                    context,
                    theme: picker.DatePickerTheme(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      cancelStyle: Theme.of(context).textTheme.titleMedium!,
                      doneStyle: Theme.of(context).textTheme.titleMedium!,
                      itemStyle: Theme.of(context).textTheme.titleMedium!,
                    ),
                    showTitleActions: true,
                    minTime: DateTime(1970),
                    maxTime: DateTime(DateTime.now().year + 1),
                    onChanged: onDateChanged,
                    currentTime: selectDate.value,
                    onConfirm: (date) {
                      selectDate.value = date;
                    },
                    locale: picker.LocaleType.pt,
                  );
                }
              case DatePickerType.showTime12hPicker:
                {
                  picker.DatePicker.showTime12hPicker(
                    context,
                    theme: picker.DatePickerTheme(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      cancelStyle: Theme.of(context).textTheme.titleMedium!,
                      doneStyle: Theme.of(context).textTheme.titleMedium!,
                      itemStyle: Theme.of(context).textTheme.titleMedium!,
                    ),
                    showTitleActions: true,
                    onChanged: onDateChanged,
                    currentTime: selectDate.value,
                    onConfirm: (date) {
                      selectDate.value = date;
                    },
                    locale: picker.LocaleType.pt,
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
            hintStyle: selectDate.value == null
                ? Theme.of(context).inputDecorationTheme.hintStyle
                : Theme.of(context).textTheme.bodyLarge,
            hintText: selectDate.value == null
                ? hint.toString()
                : getHintTextWithDateFormatted(context, datePickerType),
          ),
        );
      },
    );
  }

  String getHintTextWithDateFormatted(
    BuildContext context,
    DatePickerType datePickerType,
  ) {
    DateTime selectedDate = selectDate.value ?? DateTime.now();

    switch (datePickerType) {
      case DatePickerType.showDateTimePicker:
        return dateHelper.getDayMonthYearExtendedWithHourAndMinute(
          context,
          selectedDate,
        );

      case DatePickerType.showDatePicker:
        return dateHelper.getDayMonthYearExtendedWithoutHourAndMinute(
          context,
          selectedDate,
        );

      case DatePickerType.showTime12hPicker:
        return dateHelper.getTime(
          context,
          selectedDate,
        );

      default:
        return "";
    }
  }
}
