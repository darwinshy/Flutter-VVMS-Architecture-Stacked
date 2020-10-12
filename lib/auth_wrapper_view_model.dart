import 'package:auth/app/router.gr.dart';
import 'package:auth/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';

class AuthWrapperModel extends StreamViewModel<User> {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigatorService = locator<NavigationService>();

  void navigateToSignUp() {
    _navigatorService.navigateTo(Routes.signPageView);
  }

  @override
  // TODO: implement stream
  Stream<User> get stream => _authenticationService.authStateChanges;
}
