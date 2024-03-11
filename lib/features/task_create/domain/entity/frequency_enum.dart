import 'package:hive/hive.dart';

part 'frequency_enum.g.dart';

@HiveType(typeId: 5)
enum FrequencyEnum {
  @HiveField(1)
  WEEKLY,
  @HiveField(2)
  DAILY,
}
