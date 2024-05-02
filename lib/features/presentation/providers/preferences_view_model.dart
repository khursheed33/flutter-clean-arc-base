// ignore_for_file: unused_field

import 'package:flutter_clean_arc_base/index.dart';

class AppPreferencesViewModel extends BaseModel {
  final GetUserPreferencesUsecase _getUserPreferencesUsecase;
  final CreateUserPreferencesUsecase _createUserPreferencesUsecase;
  final UpdateUserPreferencesUsecase _updateUserPreferencesUsecase;
  final GetUserPreferencesStreamUsecase _getUserPreferencesStreamUsecase;

  AppPreferencesViewModel({
    required GetUserPreferencesUsecase getUserPreferencesUsecase,
    required CreateUserPreferencesUsecase createUserPreferencesUsecase,
    required UpdateUserPreferencesUsecase updateUserPreferencesUsecase,
    required GetUserPreferencesStreamUsecase getUserPreferencesStreamUsecase,
  })  : _getUserPreferencesUsecase = getUserPreferencesUsecase,
        _createUserPreferencesUsecase = createUserPreferencesUsecase,
        _updateUserPreferencesUsecase = updateUserPreferencesUsecase,
        _getUserPreferencesStreamUsecase = getUserPreferencesStreamUsecase;

  UserPreferencesEntity _userPreferences = const UserPreferencesEntity(
    username: "1",
    name: "Khursheed",
    surename: "Gaddi",
    themeType: ThemeType.dark,
    languageType: LanguageType.english,
    currency: "inr",
    themeColor: "red",
  );
  UserPreferencesEntity get userPreferences => _userPreferences;

  void setUserPreferences(UserPreferencesEntity userPrefs) {
    _userPreferences = userPrefs;
    notifyListeners();
  }

  Stream<ThemeData> getPreferencesStream() async* {
    ThemeData theme = ThemeData();
    final prefRes = await _getUserPreferencesUsecase.call("1");
    if (prefRes.isLeft()) {
      yield theme;
    }
    final userPrefs = FunctionalResponse.success(prefRes);
    "_createUserPreferencesUsecase: $_createUserPreferencesUsecase".log();
    "Prefs: $userPrefs".log();
    if (userPrefs != null) {
      theme = userPrefs.themeType == ThemeType.dark
          ? ThemeData.dark()
          : ThemeData.light();
    }
    yield theme;
  }

  Future<void> getPreferences() async {
    final prefRes = await _getUserPreferencesUsecase.call("1");

    final userPrefs = FunctionalResponse.success(prefRes);
    "Future:Prefs: $userPrefs".log();
    if (userPrefs != null) {
      setUserPreferences(userPrefs);
    }
  }

  Future<void> updatePreferences(UserPreferencesEntity newPrefs) async {
    setViewState(ViewState.Loading);
    const newTheme = UserPreferencesEntity(
      username: "1",
      name: "Khursheed",
      surename: "Gaddi",
      themeType: ThemeType.light,
      languageType: LanguageType.english,
      currency: "inr",
      themeColor: "red",
    );
    setUserPreferences(newTheme);
    setViewState(ViewState.Done);
  }

  @override
  void disposeModel() {}
}
