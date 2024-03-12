import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app_romavic/core/database/hive/open_boxes.dart';
import 'package:todo_app_romavic/core/database/hive/register_adapters.dart';
import 'package:todo_app_romavic/features/onboarding/domain/entity/onboarding_entity.dart';
import 'package:todo_app_romavic/features/task_create/data/data_source/task_create_data_source.dart';
import 'package:todo_app_romavic/features/task_create/data/repository/task_create_repository_impl.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/task_entity.dart';

class MockTaskCreateDataSource extends Mock implements TaskCreateDataSource {}

class MockOnboardingBox extends Mock implements Box<OnboardingEntity> {}

class MockTaskCreateBox extends Mock implements Box<TaskEntity> {}

void main() {
  late TaskCreateRepositoryImpl repository;
  late MockTaskCreateDataSource mockDataSource;
  late MockOnboardingBox mockOnboardingBox;
  late Box<TaskEntity> taskCreatedBox;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    const MethodChannel channel = MethodChannel(
      'plugins.flutter.io/path_provider',
    );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return ".";
      },
    );

    await Hive.initFlutter();
    await registerAdapters();
    await openBoxes();

    mockDataSource = MockTaskCreateDataSource();
    mockOnboardingBox = MockOnboardingBox();
    taskCreatedBox = Hive.box<TaskEntity>("task_table");

    repository = TaskCreateRepositoryImpl(
      taskCreateDataSource: mockDataSource,
      onboardingBox: mockOnboardingBox,
      taskCreateBox: taskCreatedBox,
    );
  });

  test(
    'findMeetingDays should return an empty list when startDate is after endDate',
    () {
      // Arrange
      final startDate = DateTime.now();
      final endDate = startDate.subtract(
        const Duration(days: 1),
      );
      final preferredWeekdays = [startDate.weekday];

      // Act
      final result = repository.findMeetingDays(
        startDate,
        endDate,
        preferredWeekdays,
      );

      // Assert
      expect(result, isEmpty);
    },
  );

  test(
    'findMeetingDays should return meeting days within the date range',
    () {
      // Arrange
      final startDate = DateTime(2024, 03, 11);
      final endDate = startDate.add(const Duration(days: 5));
      final preferredWeekdays = [1, 2, 3, 4, 5];

      // Act
      final result = repository.findMeetingDays(
        startDate,
        endDate,
        preferredWeekdays,
      );

      // Assert
      expect(
        result,
        containsAllInOrder(
          [
            startDate,
            startDate.add(const Duration(days: 1)),
            startDate.add(const Duration(days: 2)),
            startDate.add(const Duration(days: 3)),
            startDate.add(const Duration(days: 4))
          ],
        ),
      );
    },
  );
}
