#!
flutter clean
flutter pub get
cd core
flutter pub get
cd ../domain
flutter pub get
cd ../presentation
flutter pub get
flutter gen-l10n --arb-dir lib/l10n --template-arb-file app_en.arb --output-localization-file app_localizations.dart --output-dir lib/l10n/generated --no-synthetic-package
cd ../ios
pod install
cd ../presentation
flutter pub run build_runner build --delete-conflicting-outputs
cd ../domain
flutter pub run build_runner build --delete-conflicting-outputs