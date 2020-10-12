// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../config/size_configuration.dart';
// import '../../services/auth.dart';
// import '../../services/validators.dart';
// import '../../themes/theme.dart';
// import '../../widgets/rounded_text_field.dart';
// import '../../widgets/show_snackbar.dart';

// class SignPage extends StatefulWidget {
//   @override
//   _SignPageState createState() => _SignPageState();
// }

// class _SignPageState extends State<SignPage> {
//   // Initial Values ///////////////////////////////////////////////////////////
//   String emailField;
//   String passwordField;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   final signFormKey = GlobalKey<FormState>();
//   /////////////////////////////////////////////////////////////////////////////
//   // final _duration = const Duration(milliseconds: 500);
//   final Curve _curve = Curves.easeInOutCirc;
//   bool isDarkMode = true;
//   /////////////////////////////////////////////////////////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     // Authentication Service /////////////////////////////////////////////////
//     final authServices = Provider.of<AuthenticationService>(context);
//     // Getting Media Queries //////////////////////////////////////////////////
//     SizeConfig().init(context);
//     // Getting ThemeData  /////////////////////////////////////////////////////
//     final themeNotifier = Provider.of<ThemeNotifier>(context);
//     ///////////////////////////////////////////////////////////////////////////

//     void changeMode(int activeTabNum) {
//       if (activeTabNum == 0) {
//         themeNotifier.setTheme(lightTheme);
//       } else {
//         themeNotifier.setTheme(darkTheme);
//       }
//     }

//     ///////////////////////////////////////////////////////////////////////////

//     // Form Fields Validator //////////////////////////////////////////////////
//     String emailValidator(String value) {
//       if (value.isEmpty) return "Our AI says you entered nothing !";
//       if (validateEmail(value) != true) return "Invalid Email Address";
//       return null;
//     }

//     String passwordValidator(String value) {
//       if (value.isEmpty) return "You forgot to enter the password !";
//       if (value.length < 6) return "We need password more than 6 letters.";
//       return null;
//     }
//     ///////////////////////////////////////////////////////////////////////////

//     Future<String> startSignInProcess() async {
//       return authServices.signIn(
//         emailField.trim(),
//         passwordField.trim(),
//       );
//     }

//     Future<void> validateFormValuesForSignIn() async {
//       // Saves Form's Current State
//       final formState = signFormKey.currentState;
//       formState.save();

//       if (formState.validate() != true) return;
//       // Validate and Saves Form's Current State
//       if (formState.validate()) formState.save();

//       final result = await startSignInProcess();
//       if (result != "SIN") showSnackBar(scaffoldKey, result);
//     }

//     ////////////////////////////////////////////////////////////////////////////

//     // Future<String> startSignUpProcess() async {
//     //   return authServices.signIn(
//     //     emailField.trim(),
//     //     passwordField.trim(),
//     //   );
//     // }

//     // Future<void> validateFormValuesForSignUp() async {
//     //   // Saves Form's Current State
//     //   final formState = signFormKey.currentState;
//     //   formState.save();

//     //   if (formState.validate() != true) return;
//     //   // Validate and Saves Form's Current State
//     //   if (formState.validate()) formState.save();

//     //   final result = await startSignUpProcess();
//     //   if (result != "SUP") showSnackBarBasic(scaffoldKey, result);
//     // }

//     ////////////////////////////////////////////////////////////////////////////

//     return Scaffold(
//         key: scaffoldKey,
//         bottomNavigationBar: CurvedNavigationBar(
//           animationCurve: _curve,
//           animationDuration: const Duration(milliseconds: 500),
//           color: themeNotifier.getTheme().bottomAppBarColor,
//           backgroundColor: themeNotifier.getTheme().scaffoldBackgroundColor,
//           items: const <Widget>[
//             Icon(
//               Icons.lightbulb,
//               size: 30,
//             ),
//             Icon(
//               Icons.nights_stay,
//               size: 30,
//             ),
//           ],
//           onTap: (index) {
//             changeMode(index);
//           },
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: SafeArea(
//               child: Form(
//                 key: signFormKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const VerticalSpacing(of: 50),
//                     const VerticalSpacing(
//                       of: 100,
//                     ),
//                     const Text(
//                       "Get Started",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const VerticalSpacing(of: 10),
//                     const Text(
//                       "Enter your Informations below",
//                     ),
//                     const VerticalSpacing(of: 50),
//                     roundedTextFields(
//                         "Email",
//                         "You have an email, right ?",
//                         (value) => emailValidator(value),
//                         (value) => emailField = value,
//                         TextInputType.emailAddress),
//                     const VerticalSpacing(),
//                     roundedTextFields(
//                         "Password",
//                         "Shhh! What's your password ?",
//                         (value) => passwordValidator(value),
//                         (value) => passwordField = value,
//                         TextInputType.visiblePassword),
//                     const VerticalSpacing(of: 30),
//                     roundedNormalButton("Login", validateFormValuesForSignIn)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }
