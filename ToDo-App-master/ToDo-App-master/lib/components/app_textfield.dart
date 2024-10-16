import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.controller,
      this.prefixicon,
      this.hintText,
      this.textInputAction,
      this.isPasswords = false});

  final TextEditingController? controller;
  final bool isPasswords;
  final Icon? prefixicon;
  final String? hintText;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: Color.fromARGB(255, 177, 175, 175), width: 1.5),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 129, 198, 254),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 0)),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPasswords,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixicon,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          prefixIconConstraints:
              const BoxConstraints(minHeight: 32, minWidth: 45),
        ),
      ),
    );
  }
}
