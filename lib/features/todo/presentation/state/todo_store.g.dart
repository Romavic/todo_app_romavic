// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on TodoStoreBase, Store {
  late final _$currentDateAtom =
      Atom(name: 'TodoStoreBase.currentDate', context: context);

  @override
  DateTime? get currentDate {
    _$currentDateAtom.reportRead();
    return super.currentDate;
  }

  @override
  set currentDate(DateTime? value) {
    _$currentDateAtom.reportWrite(value, super.currentDate, () {
      super.currentDate = value;
    });
  }

  late final _$changeCurrentMonthAndYearByCalendarAsyncAction = AsyncAction(
      'TodoStoreBase.changeCurrentMonthAndYearByCalendar',
      context: context);

  @override
  Future<void> changeCurrentMonthAndYearByCalendar(DateTime newData) {
    return _$changeCurrentMonthAndYearByCalendarAsyncAction
        .run(() => super.changeCurrentMonthAndYearByCalendar(newData));
  }

  late final _$scheduleAlarmAsyncAction =
      AsyncAction('TodoStoreBase.scheduleAlarm', context: context);

  @override
  Future<void> scheduleAlarm(String title, String details, DateTime dateTime) {
    return _$scheduleAlarmAsyncAction
        .run(() => super.scheduleAlarm(title, details, dateTime));
  }

  @override
  String toString() {
    return '''
currentDate: ${currentDate}
    ''';
  }
}
