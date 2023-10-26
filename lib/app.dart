import 'package:flutter/material.dart';

import 'src/application/env.dart';

class MyApp extends StatelessWidget {
  final RouterConfig<Object>? routerConfig;

  const MyApp({required this.routerConfig, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: Env.appName, routerConfig: routerConfig);
  }
}
