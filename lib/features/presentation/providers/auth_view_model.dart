import 'package:flutter_clean_arc_base/index.dart';

class AuthViewModel extends BaseModel {
  ThemeData _appTheme = ThemeData();
  // Getter for appTheme
  ThemeData get appTheme => _appTheme;

  // Method to set the app theme
  void setAppTheme(Brightness brightness) {
    if (brightness == Brightness.light) {
      _preferencesController.add(ThemeData.light());
      return;
    }
    _appTheme = newAppTheme(brightness);
    _preferencesController.add(_appTheme);
  }

  // Declare a StreamController for your preferences
  final StreamController<ThemeData> _preferencesController =
      StreamController<ThemeData>.broadcast();

  // Expose the stream to be listened to
  Stream<ThemeData> get preferencesStream => _preferencesController.stream;

  Future<void> getPreferences() async {
    // setViewState(ViewState.Loading);
    Future.delayed(const Duration(seconds: 2), () {
      // setViewState(ViewState.Done);
      setAppTheme(Brightness.light);
    });
  }

  ThemeData newAppTheme(Brightness brightness) {
    Color? primaryColor =
        brightness == Brightness.light ? Colors.teal : Colors.blue;
    Color? primaryColorDark =
        brightness == Brightness.light ? Colors.teal[900] : Colors.blue[900];
    Color? primaryColorLight =
        brightness == Brightness.light ? Colors.teal[300] : Colors.blue[300];
    Color textColor =
        brightness == Brightness.light ? Colors.teal : Colors.white;

    ColorScheme colorScheme = ColorScheme.fromSwatch().copyWith(
      brightness: brightness,
      background:
          brightness == Brightness.light ? Colors.white : Colors.grey[900],
    );

    return ThemeData.dark();
  }

  @override
  void disposeModel() {}
}
