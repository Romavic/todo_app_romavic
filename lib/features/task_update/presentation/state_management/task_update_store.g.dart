// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_update_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskUpdateStore on TaskUpdateBase, Store {
  late final _$preferredWeekdaysAtom =
      Atom(name: 'TaskUpdateBase.preferredWeekdays', context: context);

  @override
  ObservableList<bool> get preferredWeekdays {
    _$preferredWeekdaysAtom.reportRead();
    return super.preferredWeekdays;
  }

  @override
  set preferredWeekdays(ObservableList<bool> value) {
    _$preferredWeekdaysAtom.reportWrite(value, super.preferredWeekdays, () {
      super.preferredWeekdays = value;
    });
  }

  late final _$taskCreateAsyncAction =
      AsyncAction('TaskUpdateBase.taskCreate', context: context);

  @override
  Future<void> taskCreate(
      {required dynamic key,
      required String title,
      required String details,
      required DateTime time,
      required DateTime initDate,
      required DateTime endDate,
      required FrequencyEnum frequencyEnum,
      required dynamic Function() onComplete}) {
    return _$taskCreateAsyncAction.run(() => super.taskCreate(
        key: key,
        title: title,
        details: details,
        time: time,
        initDate: initDate,
        endDate: endDate,
        frequencyEnum: frequencyEnum,
        onComplete: onComplete));
  }

  late final _$TaskUpdateBaseActionController =
      ActionController(name: 'TaskUpdateBase', context: context);

  @override
  void toggleDay(int day) {
    final _$actionInfo = _$TaskUpdateBaseActionController.startAction(
        name: 'TaskUpdateBase.toggleDay');
    try {
      return super.toggleDay(day);
    } finally {
      _$TaskUpdateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
preferredWeekdays: ${preferredWeekdays}
    ''';
  }
}
