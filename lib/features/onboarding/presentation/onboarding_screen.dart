import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_romavic/components/buttons/button_text_with_loader_component.dart';
import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/onboarding/presentation/state_management/onboarding_store.dart';
import 'package:todo_app_romavic/navigation/names_navigation.dart';
import 'package:todo_app_romavic/resources/colors.dart';
import 'package:todo_app_romavic/resources/screen_measurements.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final store = getIt.get<OnboardingStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: getWidthSizeScreen(context),
              decoration: BoxDecoration(color: primaryColor),
              child: Center(
                child: Text(
                  "Todo - App".toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                ),
              ),
            ),
          ),
          SizedBox(height: getToAppBar(context) * 2),
          Padding(
            padding: EdgeInsets.all(getToAppBar(context) * 2),
            child: Observer(builder: (context) {
              return ButtonTextWithLoaderComponent(
                onPressed: () {
                  store.login(
                    onSuccess: () {
                      context.push(todoRoute);
                    },
                    onError: (error) {
                      debugPrint(error);
                    },
                  );
                },
                state: store.stateButton,
                message: "Enter with Google",
              );
            }),
          ),
          SizedBox(height: getToAppBar(context) * 2),
        ],
      ),
    );
  }
}
