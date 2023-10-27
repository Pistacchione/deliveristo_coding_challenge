# Deliveristo Flutter Frontend Coding Challenge App

A Flutter project for Deliveristo coding challenge [here](https://github.com/andreaperinu/flutter-challenge)

## Requirements

App was build using Flutter version `3.13.6`

A `dart-define` parameter is required in order to run the app:
- `BASE_URL` the url of backend

## Getting Started

To run the app launch
```
flutter run lib\main --dart-define BASE_URL=https://dog.ceo
```

## Testing

To run unit tests launch
```
flutter test test
```

To run integration test launch
```
flutter test integration_test/app_test.dart --dart-define BASE_URL=https://dog.ceo
```
