import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

extension BuildContextExtension on BuildContext {
  GetIt get injector => GetIt.instance;
}
