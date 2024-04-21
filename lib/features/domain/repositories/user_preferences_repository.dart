import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

abstract class UserPreferencesRepository {
  Future<Either<Failure, UserPreferencesEntity?>> getUserPreferences(
      String userId);
  Future<Either<Failure, UserPreferencesEntity>> createUserPreferences(
    UserPreferencesEntity userPreferencesEntity,
  );
  Future<Either<Failure, UserPreferencesEntity>> updateUserPreferences(
    UserPreferencesEntity userPreferencesEntity,
  );
  Stream<Either<Failure, UserPreferencesEntity?>> getPreferencesStream(
    String userId,
  );
}
