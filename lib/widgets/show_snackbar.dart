import 'package:flutter/material.dart';

void showSnackBar(GlobalKey<ScaffoldState> key, String text) {
  key.currentState.showSnackBar(SnackBar(
    content: Text(text),
    padding: const EdgeInsets.all(20),
    behavior: SnackBarBehavior.floating,
  ));
}
