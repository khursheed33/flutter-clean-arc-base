# Useful commands

<!-- Build Run to Generate From Json and To Json -->

dart run build_runner build --delete-conflicting-outputs

<!-- Generate Splash Icons  -->
flutter pub run flutter_native_splash:create
<!-- Flutter Launcher Icons  -->
flutter pub run flutter_launcher_icons:main

<!-- Show outdated packages -->
flutter pub outdated

<!-- Upgrade packages -->
flutter pub upgrade --major-versions

<!-- See full list of available changes -->
dart fix --dry-run

<!-- Fix Problem:notifications -->
dart fix --apply
