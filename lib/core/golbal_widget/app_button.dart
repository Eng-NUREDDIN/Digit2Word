import 'package:digit_words/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColorLight,
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(text,
              style: const TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}
