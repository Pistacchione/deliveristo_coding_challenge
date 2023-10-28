import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../../generated/l10n/l10n.dart';

extension BuildContextExtension on BuildContext {
  GetIt get injector => GetIt.instance;

  S get translate => S.of(this);
}
