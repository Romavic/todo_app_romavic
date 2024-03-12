import 'package:alarm/alarm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_romavic/core/database/hive/open_boxes.dart';
import 'package:todo_app_romavic/core/database/hive/register_adapters.dart';
import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/firebase_options.dart';
import 'package:todo_app_romavic/navigation/go_router_navigation.dart';
import 'package:todo_app_romavic/resources/colors.dart';
import 'package:todo_app_romavic/resources/theme/light/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: primaryColor),
  );
  await Alarm.init();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await registerAdapters();
  await openBoxes();
  await dependenciesInjections();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouterNavigation,
      title: 'TodoApp - Romavic',
      debugShowCheckedModeBanner: false,
      darkTheme: lightTheme,
      theme: lightTheme,
    );
  }
}
