import 'package:flutter/material.dart';
import 'package:todoapps/components/app_color.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: AppColor.blue,
      color: Theme.of(context).colorScheme.background,
      child: Text(text),
    );
  }
}
