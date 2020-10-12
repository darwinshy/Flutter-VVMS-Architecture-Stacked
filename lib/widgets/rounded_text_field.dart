import 'package:flutter/material.dart';

import '../config/size_configuration.dart';

Widget roundedTextFields(
    String label,
    String placeholder,
    String Function(String) validator,
    void Function(String) onSaved,
    TextInputType keyboardType) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
      ),
      const VerticalSpacing(of: 10),
      TextFormField(
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          hintText: placeholder,
        ),
      ),
    ],
  );
}

Widget roundedNormalButton(String hintText, void Function() function) {
  return RaisedButton(
    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    onPressed: function,
    child: Text(hintText),
  );
}
