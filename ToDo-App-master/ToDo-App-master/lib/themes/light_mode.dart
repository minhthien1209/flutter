import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade100,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade300,
    inversePrimary: Colors.grey.shade900,
    onPrimary: Colors.black, // Thêm onPrimary cho lightMode
  ),
);
