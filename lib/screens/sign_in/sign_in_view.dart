import 'package:auth/config/size_configuration.dart';
import 'package:auth/widgets/rounded_text_field.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'sign_in_vm.dart';

class SignPageView extends StatefulWidget {
  @override
  _SignPageViewState createState() => _SignPageViewState();
}

class _SignPageViewState extends State<SignPageView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelBuilder<SignPageModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
              key: model.scaffoldKey,
              bottomNavigationBar: CurvedNavigationBar(
                animationCurve: model.curve,
                animationDuration: model.animationDuration,
                buttonBackgroundColor: Colors.pink,
                backgroundColor: Colors.transparent,
                color: Colors.pink,
                items: const <Widget>[
                  Icon(
                    Icons.lightbulb,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.nights_stay,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
                onTap: (index) {
                  getThemeManager(context).selectThemeAtIndex(index);
                },
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SafeArea(
                    child: Form(
                      key: model.signFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VerticalSpacing(of: 50),
                          const VerticalSpacing(
                            of: 100,
                          ),
                          const Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const VerticalSpacing(of: 10),
                          const Text(
                            "Enter your Informations below",
                          ),
                          const VerticalSpacing(of: 50),
                          roundedTextFields(
                              "Email",
                              "You have an email, right ?",
                              (value) => model.emailValidator(value),
                              (value) => model.emailField = value,
                              TextInputType.emailAddress),
                          const VerticalSpacing(),
                          roundedTextFields(
                              "Password",
                              "Shhh! What's your password ?",
                              (value) => model.passwordValidator(value),
                              (value) => model.passwordField = value,
                              TextInputType.visiblePassword),
                          const VerticalSpacing(of: 30),
                          roundedNormalButton(
                              "Login", model.validateFormValuesForSignIn)
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
        viewModelBuilder: () => SignPageModel());
  }
}
