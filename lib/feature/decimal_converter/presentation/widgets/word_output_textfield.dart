import 'package:digit_words/core/golbal_widget/text_with_padding.dart';
import 'package:digit_words/core/utils/app_colors.dart';
import 'package:digit_words/core/utils/assets.dart';
import 'package:digit_words/core/utils/extension/context_extension.dart';
import 'package:flutter/material.dart';

class WordOutputTextField extends StatelessWidget {
  final String textLabel;
  final String text;

  const WordOutputTextField(
      {super.key, required this.textLabel, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.width(0.6),
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          opacity: 0.1,
          image: AssetImage(AppAssets.inputTextBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWithPadding(labelText: textLabel),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColorDark),
              ),
              width: context.width(0.9),
              height: context.width(0.3),
              margin: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  maxLines: 8,
                  text,
                  style: const TextStyle(
                    color: AppColors.inputText,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
