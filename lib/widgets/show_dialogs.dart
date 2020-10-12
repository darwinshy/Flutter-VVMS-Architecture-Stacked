// ignore: file_names
import 'package:flutter/material.dart';

void showBasicDialog(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Text(text),
        );
      });
}
