import 'package:flutter/material.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // we can add more options here like analytics, crashlytics, service locator, etc
  runApp(MyApp.instance);
}
