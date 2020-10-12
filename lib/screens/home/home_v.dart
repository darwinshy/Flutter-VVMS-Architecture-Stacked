import 'package:auth/app/locator.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Authentication Service /////////////////////////////////////////////////
    final AuthenticationService _authenticationService =
        locator<AuthenticationService>();
    ///////////////////////////////////////////////////////////////////////////
    void logOut() {
      _authenticationService.signOut();
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("HOME"),
            RaisedButton(
              onPressed: logOut,
              child: const Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
