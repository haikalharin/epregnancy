->run injector generator:
flutter packages pub run build_runner build
Note: On first attempt to run this command you might encounter a conflict error. If so, please add the --delete-conflicting-outputs argument to your command:
flutter packages pub run build_runner build --delete-conflicting-outputs

flutter run --flavor development -t lib/main_development.dart
flutter run --flavor production -t lib/main_production.dart

build apk
//prod
flutter build apk --release --flavor production -t lib/main_production.dart
flutter build apk --debug --flavor production -t lib/main_production.dart

//dev
flutter build apk --release --flavor development -t lib/main_development.dart
flutter build apk --debug --flavor development -t lib/main_development.dart

//staging
flutter build apk --release --flavor staging -t lib/main_staging.dart
flutter build apk --debug --flavor staging -t lib/main_staging.dart
