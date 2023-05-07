import 'package:digit_words/core/utils/app_colors.dart';
import 'package:digit_words/core/utils/extension/context_extension.dart';
import 'package:flutter/material.dart';

class TextWithPadding extends StatelessWidget {
  final String labelText;
  final double padding;

  const TextWithPadding({super.key, required this.labelText, this.padding = 0.03});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(context.width(padding)),
      child: Text(
        labelText,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.primaryColorDark,
        ),
      ),
    );
  }
}
