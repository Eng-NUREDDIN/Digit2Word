import 'package:flutter/material.dart';

class AppTextBox extends StatelessWidget {
  final String text;
  const AppTextBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(text),
    );
  }
}
