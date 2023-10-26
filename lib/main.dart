import 'package:flutter/material.dart';

import 'app.dart';
import 'src/application/di/injection_container.dart' as di;

void main() async {
  di.init();
  await di.injector.allReady();

  runApp(const MyApp());
}
