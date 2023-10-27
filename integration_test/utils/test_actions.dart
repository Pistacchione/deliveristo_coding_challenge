import 'package:flutter_test/flutter_test.dart';

extension TestWidgetTester on WidgetTester {
  Future<void> waitFor(
    Finder finder, {
    Duration timeout = const Duration(seconds: 20),
  }) async {
    final end = binding.clock.now().add(timeout);

    do {
      if (binding.clock.now().isAfter(end)) {
        throw Exception('Timed out waiting for $finder');
      }

      await pump(const Duration(milliseconds: 100));
    } while (finder.evaluate().isEmpty);
  }
}
