import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade600,
    secondary: const Color.fromARGB(255, 65, 64, 64),
    inversePrimary: Colors.grey.shade300,
    onPrimary: Colors.white, // Thêm onPrimary cho darkMode
  ),
);
