import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

class UserPreferencesRepositoryImpl implements UserPreferencesRepository {
  final UserPreferenceRemoteDatasource _datasource;
  final SafeApiCall _safeApiCall;

  UserPreferencesRepositoryImpl({
    required UserPreferenceRemoteDatasource datasource,
    required SafeApiCall safeApiCall,
  })  : _datasource = datasource,
        _safeApiCall = safeApiCall;

  @override
  Future<Either<Failure, UserPreferencesEntity>> createUserPreferences(
      UserPreferencesEntity userPreferencesEntity) async {
    return await _safeApiCall.call<UserPreferencesEntity>(
      () => _datasource.createUserPreferences(userPreferencesEntity),
    );
  }

  @override
  Future<Either<Failure, UserPreferencesEntity?>> getUserPreferences(
      String userId) async {
    return await _safeApiCall.call<UserPreferencesEntity?>(
      () => _datasource.getUserPreferences(userId),
    );
  }

  @override
  Future<Either<Failure, UserPreferencesEntity>> updateUserPreferences(
      UserPreferencesEntity userPreferencesEntity) async {
    return await _safeApiCall.call<UserPreferencesEntity>(
      () => _datasource.updateUserPreferences(userPreferencesEntity),
    );
  }

  @override
  Stream<Either<Failure, UserPreferencesEntity?>> getPreferencesStream(
      String userId) async* {
    yield* _safeApiCall
        .callStream(() => _datasource.getPreferencesStream(userId));
  }
}
