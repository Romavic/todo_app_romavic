import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:alarm/alarm.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:todo_app_romavic/resources/theme/dark/dark_theme.dart';
import 'package:todo_app_romavic/resources/theme/light/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: primaryColor),
  );
  await Alarm.init();
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await registerAdapters();
  await openBoxes();
  await dependenciesInjections();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('pt', 'PT'),
        Locale('en', 'US'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: App(savedThemeMode: savedThemeMode),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key, this.savedThemeMode});

  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp.router(
          routerConfig: goRouterNavigation,
          title: 'TodoApp - Romavic',
          debugShowCheckedModeBanner: false,
          darkTheme: darkTheme,
          theme: theme,
        );
      },
    );
  }
}
