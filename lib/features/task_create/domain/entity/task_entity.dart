import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/frequency_enum.dart';

part 'task_entity.g.dart';

@HiveType(typeId: 2)
class TaskEntity extends HiveObject {
  @HiveField(1)
  String? idUser;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? details;
  @HiveField(4)
  FrequencyEnum? typeOfTask;
  @HiveField(5)
  bool? isTaskComplete;
  @HiveField(6)
  DateTime? initDate;
  @HiveField(7)
  DateTime? endDate;
  @HiveField(8)
  List<StreakTaskEntity>? streaks;

  TaskEntity({
    this.idUser,
    this.title,
    this.details,
    this.typeOfTask,
    this.isTaskComplete,
    this.initDate,
    this.endDate,
    this.streaks,
  });
}

@HiveType(typeId: 3)
class StreakTaskEntity extends HiveObject {
  @HiveField(1)
  DateTime? dateTime;
  @HiveField(2)
  bool? isDone;

  StreakTaskEntity({
    this.dateTime,
    this.isDone,
  });
}