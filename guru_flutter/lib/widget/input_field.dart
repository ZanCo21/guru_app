// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

InputField({
  required double width,
  required TextEditingController controller,
  required String hintText,
  bool isObscure = false,
}) {
  return Container(
    width: width * 0.8,
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 0, 0),
          fontSize: 22,
        ),
        hintText: hintText,
        border: InputBorder.none,
      ),
      obscureText: isObscure,
    ),
  );
}