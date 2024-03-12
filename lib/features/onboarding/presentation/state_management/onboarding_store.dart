import 'package:mobx/mobx.dart';
import 'package:todo_app_romavic/features/onboarding/domain/repository/onboarding_repository.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = OnboardingBase with _$OnboardingStore;

abstract class OnboardingBase with Store {
  final OnboardingRepository onboardingRepository;

  OnboardingBase({
    required this.onboardingRepository,
  });

  @observable
  bool stateButton = false;

  @action
  void changeStateButton(bool state) {
    stateButton = state;
  }

  @action
  Future<void> login({
    required Function() onSuccess,
  }) async {
    changeStateButton(true);
    await onboardingRepository.loginApp().whenComplete(
      () {
        changeStateButton(false);
        onSuccess();
      },
    );
  }
}
