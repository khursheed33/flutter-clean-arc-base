<!-- Build Run to Generate From Json and To Json -->
flutter pub run build_runner build
flutter packages pub run build_runner build --delete-conflicting-outputs

<!-- Generate Splash Icons  -->
flutter pub run flutter_native_splash:create
<!-- Flutter Launcher Icons  -->
flutter pub run flutter_launcher_icons:main