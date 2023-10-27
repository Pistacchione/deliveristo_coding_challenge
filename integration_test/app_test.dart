import 'package:deliveristo_flutter_challenge/app.dart';
import 'package:deliveristo_flutter_challenge/src/application/di/injection_container.dart' as di;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'utils/test_actions.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2e application tests', () {
    testWidgets('get random image', (tester) async {
      di.init();
      await di.injector.allReady();

      await tester.pumpWidget(const MyApp());
      await tester.waitFor(find.text('Random image by breed'));

      final listRow = find.byKey(const ValueKey('randomImageByBreed'));
      await tester.tap(listRow);
      await tester.pump();

      await tester.waitFor(find.byKey(const ValueKey('breedDropDown')));
      final dropdown = find.byKey(const ValueKey('breedDropDown'));
      await tester.tap(dropdown);
      await tester.pump();

      final dropdownItem = find.text('affenpinscher').last;
      await tester.tap(dropdownItem);
      await tester.pump();

      expect(find.text('Get Dog by affenpinscher'), findsOneWidget);

      await tester.tap(find.text('Get Dog by affenpinscher'));
      await tester.pump();
      await tester.waitFor(find.byKey(const ValueKey('randomDogImage')));
    });
  });
}
