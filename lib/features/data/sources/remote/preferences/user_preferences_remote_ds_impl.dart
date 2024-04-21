import 'package:flutter_clean_arc_base/features/data/models/preferences/user_preferences_model.dart';
import 'package:flutter_clean_arc_base/index.dart';

class UserPreferencesRemoteDatasourceImpl
    implements UserPreferenceRemoteDatasource {
  final Box _hiveBox;

  UserPreferencesRemoteDatasourceImpl({required Box hiveBox})
      : _hiveBox = hiveBox;
  @override
  Future<UserPreferencesEntity> createUserPreferences(
      UserPreferencesEntity userPreferencesEntity) async {
    final userPrefJson = UserPreferencesModel(
      username: userPreferencesEntity.username,
      name: userPreferencesEntity.name,
      surename: userPreferencesEntity.surename,
      themeType: userPreferencesEntity.themeType,
      languageType: userPreferencesEntity.languageType,
      currency: userPreferencesEntity.currency,
      themeColor: userPreferencesEntity.themeColor,
    ).toJson();

    await _hiveBox.put(HiveKeys.userPreferences, userPrefJson);
    return userPreferencesEntity;
  }

  @override
  Future<UserPreferencesEntity?> getUserPreferences(String userId) async {
    final res =
        await _hiveBox.get(HiveKeys.userPreferences) as Map<dynamic, dynamic>?;
    if (res == null) {
      return null;
    }
    final userPrefModel = UserPreferencesModel.fromJson(Map.from(res));

    return userPrefModel;
  }

  @override
  Future<UserPreferencesEntity> updateUserPreferences(
      UserPreferencesEntity userPreferencesEntity) async {
    final userPrefJson = UserPreferencesModel(
      username: userPreferencesEntity.username,
      name: userPreferencesEntity.name,
      surename: userPreferencesEntity.surename,
      themeType: userPreferencesEntity.themeType,
      languageType: userPreferencesEntity.languageType,
      currency: userPreferencesEntity.currency,
      themeColor: userPreferencesEntity.themeColor,
    ).toJson();

    await _hiveBox.put(HiveKeys.userPreferences, userPrefJson);
    return userPreferencesEntity;
  }

  @override
  Stream<UserPreferencesEntity?> getPreferencesStream(String userId) async* {
    final prefs = await getUserPreferences(userId);
    yield prefs;
  }
}
