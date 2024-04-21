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

  Stream<UserPreferencesEntity?> getPreferencesStream() {
    StreamController<UserPreferencesEntity?> controller;
    controller = StreamController<UserPreferencesEntity?>();

    _getUserPreferencesStreamUsecase.callStream("1").listen((event) {
      if (event.isRight()) {
        final userPrefs = FunctionalResponse.success(event);
        controller.add(userPrefs);
      } else {
        // Handle error or return null
        controller.add(null);
      }
    });

    return controller.stream;
  }

  Future<void> getPreferences() async {
    final prefRes = await _getUserPreferencesUsecase.call("1");

    final userPrefs = FunctionalResponse.success(prefRes);
    "Future:Prefs: $userPrefs".log();
    if (userPrefs != null) {
      // setUserPreferences(userPrefs);
    }
  }

  Future<void> createUserPreferences() async {
    "_createUserPreferencesUsecase: $_createUserPreferencesUsecase".log();
  }

  Future<void> updatePreferences(UserPreferencesEntity newPrefs) async {
    setViewState(ViewState.Loading);

    Future.delayed(const Duration(seconds: 2), () async {
      await _updateUserPreferencesUsecase.call(newPrefs).then((value) {
        "Updated: ${value.isRight()}".log();
        setViewState(ViewState.Done);
      });
    });
  }

  @override
  void disposeModel() {}
}
