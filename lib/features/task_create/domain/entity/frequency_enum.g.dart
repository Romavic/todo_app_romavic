// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frequency_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FrequencyEnumAdapter extends TypeAdapter<FrequencyEnum> {
  @override
  final int typeId = 5;

  @override
  FrequencyEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return FrequencyEnum.WEEKLY;
      case 2:
        return FrequencyEnum.DAILY;
      default:
        return FrequencyEnum.WEEKLY;
    }
  }

  @override
  void write(BinaryWriter writer, FrequencyEnum obj) {
    switch (obj) {
      case FrequencyEnum.WEEKLY:
        writer.writeByte(1);
        break;
      case FrequencyEnum.DAILY:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FrequencyEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
