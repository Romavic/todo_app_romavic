// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskEntityAdapter extends TypeAdapter<TaskEntity> {
  @override
  final int typeId = 2;

  @override
  TaskEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskEntity(
      idUser: fields[1] as String?,
      title: fields[2] as String?,
      details: fields[3] as String?,
      typeOfTask: fields[4] as FrequencyEnum?,
      isTaskComplete: fields[5] as bool?,
      initDate: fields[6] as DateTime?,
      endDate: fields[7] as DateTime?,
      streaks: (fields[8] as List?)?.cast<StreakTaskEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, TaskEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.idUser)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.details)
      ..writeByte(4)
      ..write(obj.typeOfTask)
      ..writeByte(5)
      ..write(obj.isTaskComplete)
      ..writeByte(6)
      ..write(obj.initDate)
      ..writeByte(7)
      ..write(obj.endDate)
      ..writeByte(8)
      ..write(obj.streaks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StreakTaskEntityAdapter extends TypeAdapter<StreakTaskEntity> {
  @override
  final int typeId = 3;

  @override
  StreakTaskEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StreakTaskEntity(
      dateTime: fields[1] as DateTime?,
      isDone: fields[2] as bool?,
      alarmIdentifier: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StreakTaskEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.isDone)
      ..writeByte(3)
      ..write(obj.alarmIdentifier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreakTaskEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
