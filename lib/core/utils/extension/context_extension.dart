import 'package:digit_words/core/localization/localization.dart';
import 'package:flutter/material.dart';

extension CtxExt on BuildContext {
  double width([double factor = 1]) =>
      MediaQuery.of(this).size.width * factor;

  double height([double factor = 1]) =>
      MediaQuery.of(this).size.height * factor;

  String translate(String key) => AppLocalization.of(this).translate(key);
}