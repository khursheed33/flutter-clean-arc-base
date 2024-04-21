import '../../../../domain/entities/user_preferences_entity.dart';

abstract class UserPreferenceRemoteDatasource {
  Future<UserPreferencesEntity?> getUserPreferences(String userId);
  Future<UserPreferencesEntity> createUserPreferences(
      UserPreferencesEntity userPreferencesEntity);
  Future<UserPreferencesEntity> updateUserPreferences(
      UserPreferencesEntity userPreferencesEntity);
  Stream<UserPreferencesEntity?> getPreferencesStream(String userId);
}
