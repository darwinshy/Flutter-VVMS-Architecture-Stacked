import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color offWhite = Colors.grey[100];
Color offWhite1 = Colors.grey[300];
Color offWhite2 = Colors.grey[400];

// Light Themed Colors
Color offBlack = Colors.grey[900];
Color offBlack1 = Colors.grey[700];
Color offBlack2 = Colors.grey[800];

// Misc Linear Gradients
final List<Color> lightBgColors = [
  const Color(0xF2F2F2F2),
  const Color(0xF7F7F7F7),
];
final List<Color> darkBgColors = [
  const Color(0x00000000),
  const Color(0x56546546),
];

List<ThemeData> getThemes() {
  return [lightTheme, darkTheme];
}
// Dark Themed Colors

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: offWhite, foregroundColor: offBlack),
    scaffoldBackgroundColor: offBlack,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: ButtonThemeData(
        buttonColor: offWhite, textTheme: ButtonTextTheme.primary),
    appBarTheme: AppBarTheme(
        color: offBlack,
        textTheme: textTheme("dark"),
        elevation: 0,
        iconTheme: iconThemeData("dark")),
    textTheme: TextTheme(
        bodyText2: GoogleFonts.montserrat(
      color: offWhite,
    )),
    inputDecorationTheme: inputDecorationTheme("dark"));

final lightTheme = ThemeData(
    brightness: Brightness.light,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: offWhite, foregroundColor: offWhite),
    scaffoldBackgroundColor: offWhite,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: ButtonThemeData(
        buttonColor: offBlack, textTheme: ButtonTextTheme.primary),
    appBarTheme: AppBarTheme(
        color: offWhite,
        textTheme: textTheme("light"),
        elevation: 0,
        iconTheme: iconThemeData("light")),
    textTheme: TextTheme(
        bodyText2: GoogleFonts.montserrat(
      color: offBlack,
    )),
    inputDecorationTheme: inputDecorationTheme("light"));

//########################################################################################################

InputDecorationTheme inputDecorationTheme(String mode) {
  final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      gapPadding: 20,
      borderRadius: BorderRadius.circular(10),
      borderSide:
          BorderSide(width: 0.3, color: mode != "dark" ? offBlack : offWhite));

  return InputDecorationTheme(
      labelStyle: TextStyle(
        color: mode == "dark"
            ? offWhite2.withOpacity(0.3)
            : offBlack2.withOpacity(0.3),
      ),
      hintStyle: TextStyle(
        color: mode == "dark"
            ? offWhite2.withOpacity(0.3)
            : offBlack2.withOpacity(0.3),
      ),
      enabledBorder: outlineInputBorder,
      border: outlineInputBorder,
      focusedBorder: outlineInputBorder);
}

//########################################################################################################

IconThemeData iconThemeData(String mode) {
  return IconThemeData(
    color: mode == "dark" ? offWhite : offBlack,
  );
}

//########################################################################################################

TextTheme textTheme(String mode) {
  return TextTheme(
    bodyText1:
        TextStyle(color: mode == "dark" ? offWhite : offBlack, fontSize: 50),
    headline6:
        TextStyle(color: mode == "dark" ? offWhite : offBlack, fontSize: 15),
  );
}

//########################################################################################################
