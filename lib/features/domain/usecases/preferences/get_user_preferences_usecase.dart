import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

class GetUserPreferencesUsecase
    extends BaseUsecase<UserPreferencesEntity, String> {
  final UserPreferencesRepository repository;
  GetUserPreferencesUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, UserPreferencesEntity>> call(params) async {
    return await repository.getUserPreferences(params);
  }
}
