import 'package:flutter/material.dart';

enum TextFieldType { Email, Password }

Widget buildTextField({
  required TextEditingController controller,
  required bool isVisible,
  required void Function(bool) toggleVisibility,
  required TextFieldType type,
  required String? Function(String? value) validator,
}) {
  return TextFormField(
    controller: controller,
    style: TextStyle(
        fontSize: type == TextFieldType.Email
            ? 14
            : isVisible
                ? 13.0
                : 10.0),
    decoration: buildInputDecoration(
      type == TextFieldType.Email ? 'Email' : 'Password',
      type == TextFieldType.Email ? 'test@gmail.com' : '......',
    ).copyWith(
      suffixIcon: type == TextFieldType.Password
          ? InkWell(
              onTap: () => toggleVisibility(!isVisible),
              child: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                color: Color.fromARGB(255, 186, 182, 182),
              ),
            )
          : null,
    ),
    obscureText: type == TextFieldType.Password && !isVisible,
    validator: (value) {
      if (type == TextFieldType.Email) {
        return validateEmail(value);
      } else if (type == TextFieldType.Password) {
        return validatePassword(value);
      }
      return null;
    },
  );
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email';
  } else if (!RegExp(r'^[a-zA-Z0-9]+@gmail\.com$').hasMatch(value)) {
    return 'Please enter a valid gmail address';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid password';
  } else if (value.length < 7) {
    return 'Password should be at least 6 characters';
  } else if (value.length > 13) {
    return 'Password should be at most 13 characters';
  }
  return null;
}

InputDecoration buildInputDecoration(String labelText, String hintText) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    labelStyle: TextStyle(fontWeight: FontWeight.bold),
    hintStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.white,
    filled: true,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: Colors.red),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    errorStyle: TextStyle(
      color: Colors.red,
    ),
  );
}
