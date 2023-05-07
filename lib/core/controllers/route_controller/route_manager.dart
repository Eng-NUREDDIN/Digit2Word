import 'package:digit_words/core/controllers/route_controller/routes_name.dart';
import 'package:digit_words/feature/decimal_converter/presentation/pages/decimal_converter_page.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static Widget routesWhere(String route) {
    switch (route) {
      case RoutesName.home:
        return DecimalConverterPage();
      default:
        return DecimalConverterPage();
    }
  }

  static Map<String, Widget Function(BuildContext context)> allRoutes() => {
        RoutesName.home: (c) => routesWhere(RoutesName.home),
      };
}
