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

  late final _$tasksObservableAtom =
      Atom(name: 'TodoStoreBase.tasksObservable', context: context);

  @override
  ObservableList<TaskEntity> get tasksObservable {
    _$tasksObservableAtom.reportRead();
    return super.tasksObservable;
  }

  @override
  set tasksObservable(ObservableList<TaskEntity> value) {
    _$tasksObservableAtom.reportWrite(value, super.tasksObservable, () {
      super.tasksObservable = value;
    });
  }

  late final _$copyTasksObservableAtom =
      Atom(name: 'TodoStoreBase.copyTasksObservable', context: context);

  @override
  ObservableList<TaskEntity> get copyTasksObservable {
    _$copyTasksObservableAtom.reportRead();
    return super.copyTasksObservable;
  }

  @override
  set copyTasksObservable(ObservableList<TaskEntity> value) {
    _$copyTasksObservableAtom.reportWrite(value, super.copyTasksObservable, () {
      super.copyTasksObservable = value;
    });
  }

  late final _$changeCurrentMonthAndYearByCalendarAsyncAction = AsyncAction(
      'TodoStoreBase.changeCurrentMonthAndYearByCalendar',
      context: context);

  @override
  Future<void> changeCurrentMonthAndYearByCalendar(
      DateTime newData, List<TaskEntity> tasks) {
    return _$changeCurrentMonthAndYearByCalendarAsyncAction
        .run(() => super.changeCurrentMonthAndYearByCalendar(newData, tasks));
  }

  late final _$addTasksAsyncAction =
      AsyncAction('TodoStoreBase.addTasks', context: context);

  @override
  Future<void> addTasks(List<TaskEntity> tasks) {
    return _$addTasksAsyncAction.run(() => super.addTasks(tasks));
  }

  @override
  String toString() {
    return '''
currentDate: ${currentDate},
tasksObservable: ${tasksObservable},
copyTasksObservable: ${copyTasksObservable}
    ''';
  }
}
