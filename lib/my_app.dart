import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/controllers/route_controller/route_manager.dart';
import 'core/utils/app_string.dart';
import 'feature/decimal_converter/presentation/manager/decimal_converter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  ///singleton instance.
  static const instance = MyApp._internal();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DecimalConverterBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
          // here we can customize our application more with routes and themes ..etc.
          //for example://routes: RoutesManager.allRoutes(),theme: ThemeManager.theme(),
          routes: RoutesManager.allRoutes()),
    );
  }
}
