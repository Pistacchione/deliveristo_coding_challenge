import 'package:flutter/material.dart';

import 'app.dart';
import 'src/application/di/injection_container.dart' as di;
import 'src/application/routes/app_router.dart';

void main() async {
  di.init();
  await di.injector.allReady();

  runApp(MyApp(routerConfig: di.injector<AppRouter>().router));
}
