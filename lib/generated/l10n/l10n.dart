// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Amazing Random Dog`
  String get getStarted {
    return Intl.message(
      'Amazing Random Dog',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Breed`
  String get breed {
    return Intl.message(
      'Breed',
      name: 'breed',
      desc: '',
      args: [],
    );
  }

  /// `Sub Breed`
  String get subBreed {
    return Intl.message(
      'Sub Breed',
      name: 'subBreed',
      desc: '',
      args: [],
    );
  }

  /// `Random Dog`
  String get homeTitle {
    return Intl.message(
      'Random Dog',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `{many, plural, one{Dog by breed} other{Dogs by breed}}`
  String dogByBreedTitle(int many) {
    return Intl.plural(
      many,
      one: 'Dog by breed',
      other: 'Dogs by breed',
      name: 'dogByBreedTitle',
      desc: '',
      args: [many],
    );
  }

  /// `{many, plural, one{Dog by breed and sub breed} other{Dogs by breed and sub breed}}`
  String dogByBreedSubBreedTitle(int many) {
    return Intl.plural(
      many,
      one: 'Dog by breed and sub breed',
      other: 'Dogs by breed and sub breed',
      name: 'dogByBreedSubBreedTitle',
      desc: '',
      args: [many],
    );
  }

  /// `Get Dog`
  String get disableSubmit {
    return Intl.message(
      'Get Dog',
      name: 'disableSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Get Dog by {breed}`
  String submitBreedSelection(String breed) {
    return Intl.message(
      'Get Dog by $breed',
      name: 'submitBreedSelection',
      desc: '',
      args: [breed],
    );
  }

  /// `Get Dog by {subBreed} {breed}`
  String submitBreedSubBreedSelection(String breed, String subBreed) {
    return Intl.message(
      'Get Dog by $subBreed $breed',
      name: 'submitBreedSubBreedSelection',
      desc: '',
      args: [breed, subBreed],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
