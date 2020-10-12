import 'package:auth/app/locator.dart';
import 'package:auth/services/auth.dart';
import 'package:auth/services/validators.dart';
import 'package:auth/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignPageModel extends BaseViewModel {
  // Getting the services /////////////////////////////////////////////////////

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  // Initial Values ///////////////////////////////////////////////////////////
  String emailField;
  String passwordField;
  final Duration _animationDuration = const Duration(milliseconds: 500);
  final bool _isDarkMode = true;
  final Curve _curve = Curves.easeInOutCirc;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final signFormKey = GlobalKey<FormState>();

  // Getters //////////////////////////////////////////////////////////////////

  AuthenticationService get authenticationService => _authenticationService;
  Curve get curve => _curve;
  bool get isDarkMode => _isDarkMode;
  Duration get animationDuration => _animationDuration;

  // Form Fields Validator //////////////////////////////////////////////////
  String emailValidator(String value) {
    if (value.isEmpty) return "Our AI says you entered nothing !";
    if (validateEmail(value) != true) return "Invalid Email Address";
    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty) return "You forgot to enter the password !";
    if (value.length < 6) return "We need password more than 6 letters.";
    return null;
  }

  // Logics and Function //////////////////////////////////////////////////////

  // void changeMode(int activeTabNum) {
  //   if (activeTabNum == 0) {
  //     getThemeManager(context).
  //   } else {
  //     themeNotifier.toggleDarkLightTheme();
  //   }
  //   notifyListeners();
  // }

  Future<String> startSignInProcess() async {
    return _authenticationService.signIn(
      emailField.trim(),
      passwordField.trim(),
    );
  }

  Future<void> validateFormValuesForSignIn() async {
    // Saves Form's Current State
    final formState = signFormKey.currentState;
    formState.save();

    if (formState.validate() != true) return;
    // Validate and Saves Form's Current State
    if (formState.validate()) formState.save();

    final result = await startSignInProcess();
    if (result != "SIN") showSnackBar(scaffoldKey, result);
  }
}
