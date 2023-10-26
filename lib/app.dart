import 'package:flutter/material.dart';

import 'src/application/env.dart';
import 'src/application/extensions/buildcontext_extension.dart';
import 'src/application/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Env.appName,
      routerConfig: context.injector<AppRouter>().router,
    );
  }
}
