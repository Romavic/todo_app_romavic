import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_romavic/components/buttons/button_text_with_loader_component.dart';
import 'package:todo_app_romavic/di/dependency_injections.dart';
import 'package:todo_app_romavic/features/onboarding/presentation/state_management/onboarding_store.dart';
import 'package:todo_app_romavic/navigation/names_navigation.dart';
import 'package:todo_app_romavic/resources/screen_measurements.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final store = getIt.get<OnboardingStore>();
  var nameController = TextEditingController(text: "");

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: getToAppBar(context) * 2),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Name",
              ),
            ),
            const SizedBox(height: 10),
            ButtonTextWithLoaderComponent(
              onPressed: () {
                store.login(
                  nameController.text.toString(),
                  onSuccess: () {
                    context.pushReplacement(todoRoute);
                  },
                  onError: (message) {},
                );
              },
              state: store.stateButton,
              message: "Create",
            ),
          ],
        ),
      ),
    );
  }
}
