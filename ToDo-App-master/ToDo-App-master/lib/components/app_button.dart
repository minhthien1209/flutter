import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.onpress,
    required this.height,
    required this.text,
    required this.textColor,
    required this.color,
    required this.borderColor,
  });
  final Function()? onpress;
  final double height;
  final String text;
  final Color textColor;
  final Color color;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: borderColor,
            width: 1.6,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              spreadRadius: 1,
              blurRadius: 6.8,
              offset: Offset(0, 0.6),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
