import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_romavic/core/database/hive/tables_validation.dart';
import 'package:todo_app_romavic/features/onboarding/presentation/onboarding_screen.dart';
import 'package:todo_app_romavic/features/task_create/domain/entity/extra/task_create_extra.dart';
import 'package:todo_app_romavic/features/task_create/presentation/task_create_screen.dart';
import 'package:todo_app_romavic/features/task_details/domain/extras/task_details_extras.dart';
import 'package:todo_app_romavic/features/task_details/presentation/task_details_screen.dart';
import 'package:todo_app_romavic/features/task_update/domain/entity/extra/task_update_extra.dart';
import 'package:todo_app_romavic/features/task_update/presentation/task_update_screen.dart';
import 'package:todo_app_romavic/features/todo/presentation/todo_screen.dart';

import 'names_navigation.dart';

final GoRouter goRouterNavigation = GoRouter(
  initialLocation: initialRoute,
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: initialRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
      redirect: (BuildContext context, GoRouterState state) {
        if (hasOnboardingData) {
          return todoRoute;
        } else {
          return initialRoute;
        }
      },
    ),
    GoRoute(
      path: todoRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const TodoScreen();
      },
    ),
    GoRoute(
      path: taskCreateRoute,
      builder: (BuildContext context, GoRouterState state) {
        final taskCreateExtra = state.extra as TaskCreateExtra;
        return TaskCreateScreen(taskCreateExtra: taskCreateExtra);
      },
    ),
    GoRoute(
      path: taskDetailsRoute,
      builder: (BuildContext context, GoRouterState state) {
        final taskDetailsExtras = state.extra as TaskDetailsExtras;
        return TaskDetailsScreen(taskDetailsExtras: taskDetailsExtras);
      },
    ),
    GoRoute(
      path: taskUpdateRoute,
      builder: (BuildContext context, GoRouterState state) {
        final taskUpdateExtra = state.extra as TaskUpdateExtra;
        return TaskUpdateScreen(taskUpdateExtra: taskUpdateExtra);
      },
    ),
  ],
);
