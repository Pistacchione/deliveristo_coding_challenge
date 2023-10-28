import 'package:bloc_test/bloc_test.dart';
import 'package:deliveristo_flutter_challenge/generated/l10n/l10n.dart';
import 'package:deliveristo_flutter_challenge/src/commons/models/breed.dart';
import 'package:deliveristo_flutter_challenge/src/features/dog_by_breed/bloc/dog_by_breed_cubit.dart';
import 'package:deliveristo_flutter_challenge/src/features/dog_by_breed/pages/dog_by_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDobByBreedCubit extends MockCubit<DogByBreedState> implements DobByBreedCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late final MockDobByBreedCubit dogByBreedCubit;

  setUpAll(() {
    registerFallbackValue(DogByBreedStateInitial());
  });

  setUp(() {
    dogByBreedCubit = MockDobByBreedCubit();
  });

  testWidgets('Random Dog by breed', (tester) async {
    when(() => dogByBreedCubit.state).thenReturn(DogByBreedStateListOfBreed(breeds: [
      Breed(name: 'A'),
      Breed(name: 'B'),
      Breed(name: 'C'),
    ]));

    await tester.pumpWidget(
      BlocProvider<DobByBreedCubit>.value(
        value: dogByBreedCubit,
        child: MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const DogByBreedPage(),
        ),
      ),
    );
    expect(find.text('Get Dog'), findsOneWidget);

    final dropdown = find.byKey(const ValueKey('breedDropDown'));
    await tester.tap(dropdown);
    await tester.pump();

    final dropdownItem = find.text('A').last;
    await tester.tap(dropdownItem);
    await tester.pump();

    expect(find.text('Get Dog by A'), findsOneWidget);
  });
}
