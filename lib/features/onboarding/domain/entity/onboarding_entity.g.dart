// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OnboardingEntityAdapter extends TypeAdapter<OnboardingEntity> {
  @override
  final int typeId = 1;

  @override
  OnboardingEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OnboardingEntity(
      userId: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OnboardingEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnboardingEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
