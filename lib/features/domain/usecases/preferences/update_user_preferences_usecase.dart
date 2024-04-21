import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

class UpdateUserPreferencesUsecase
    extends BaseUsecase<UserPreferencesEntity, UserPreferencesEntity> {
  final UserPreferencesRepository repository;
  UpdateUserPreferencesUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, UserPreferencesEntity>> call(params) async {
    return await repository.updateUserPreferences(params);
  }
}
