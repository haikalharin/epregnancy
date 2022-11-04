->run injector generator:
flutter packages pub run build_runner build
Note: On first attempt to run this command you might encounter a conflict error. If so, please add the --delete-conflicting-outputs argument to your command:
flutter packages pub run build_runner build --delete-conflicting-outputs

flutter run --flavor development -t lib/main_development.dart
flutter run --flavor production -t lib/main_production.dart