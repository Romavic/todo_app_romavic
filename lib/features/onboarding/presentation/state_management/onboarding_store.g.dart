// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingStore on OnboardingBase, Store {
  late final _$stateButtonAtom =
      Atom(name: 'OnboardingBase.stateButton', context: context);

  @override
  bool get stateButton {
    _$stateButtonAtom.reportRead();
    return super.stateButton;
  }

  @override
  set stateButton(bool value) {
    _$stateButtonAtom.reportWrite(value, super.stateButton, () {
      super.stateButton = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('OnboardingBase.login', context: context);

  @override
  Future<void> login(String name,
      {required dynamic Function() onSuccess,
      required dynamic Function(String) onError}) {
    return _$loginAsyncAction
        .run(() => super.login(name, onSuccess: onSuccess, onError: onError));
  }

  late final _$OnboardingBaseActionController =
      ActionController(name: 'OnboardingBase', context: context);

  @override
  void changeStateButton(bool state) {
    final _$actionInfo = _$OnboardingBaseActionController.startAction(
        name: 'OnboardingBase.changeStateButton');
    try {
      return super.changeStateButton(state);
    } finally {
      _$OnboardingBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateButton: ${stateButton}
    ''';
  }
}
