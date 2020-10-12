import 'package:auth/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

final locator = GetIt.instance;

@injectable
void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationService(FirebaseAuth.instance));
  locator.registerLazySingleton<ThemeService>(() => ThemeService());
}
