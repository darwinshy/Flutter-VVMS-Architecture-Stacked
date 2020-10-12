import 'package:auth/app/locator.dart';
import 'package:auth/screens/sign_in/sign_in_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'app/router.gr.dart' as router;
import 'auth_wrapper_view_model.dart';
import 'screens/home/home_v.dart';

import 'themes/theme.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ThemeManager.initialise();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeNotifier>(context);
    return ThemeBuilder(
      themes: getThemes(),
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
          themeMode: themeMode,
          darkTheme: darkTheme,
          theme: regularTheme,
          debugShowCheckedModeBanner: false,
          home: AuthenticationWrapper(),
          // initialRoute: Routes.signPageView,
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: router.Router().onGenerateRoute),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthWrapperModel>.reactive(
        builder: (context, model, child) {
          if (model.data != null) {
            return HomePageView();
          } else {
            return SignPageView();
          }
        },
        viewModelBuilder: () => AuthWrapperModel());
  }
}
