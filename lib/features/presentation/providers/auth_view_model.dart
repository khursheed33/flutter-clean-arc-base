import 'package:flutter_clean_arc_base/index.dart';

class AuthViewModel extends BaseModel {
  final GetUserPreferencesUsecase _getUserPreferencesUsecase;
  final CreateUserPreferencesUsecase _createUserPreferencesUsecase;
  final UpdateUserPreferencesUsecase _updateUserPreferencesUsecase;

  AuthViewModel({
    required GetUserPreferencesUsecase getUserPreferencesUsecase,
    required CreateUserPreferencesUsecase createUserPreferencesUsecase,
    required UpdateUserPreferencesUsecase updateUserPreferencesUsecase,
  })  : _getUserPreferencesUsecase = getUserPreferencesUsecase,
        _createUserPreferencesUsecase = createUserPreferencesUsecase,
        _updateUserPreferencesUsecase = updateUserPreferencesUsecase;

  UserPreferencesEntity? _userPreferences;
  UserPreferencesEntity? get userPreferences => _userPreferences;

  void setUserPreferences(UserPreferencesEntity? userPrefs) {
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

    await _updateUserPreferencesUsecase.call(newPrefs).then((value) {
      "Updated: ${value.isRight()}".log();
      setViewState(ViewState.Done);
    });
  }

  ThemeData newAppTheme(Brightness brightness) {
    return ThemeData.dark();
  }

  @override
  void disposeModel() {}
}
