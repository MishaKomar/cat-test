# cattest

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Environment variables:
- API_URL - string - the link to the data API
- IMAGE_URL - string - the link to the image API
- IS_DEMO - true/false - if true use mocked data if false use data from API specified in API_URL

## Run with mocked data:
`$flutter run --release --dart-define=IS_DEMO=true`

## Run with API data:
`$flutter run --release`