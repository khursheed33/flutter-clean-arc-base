import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

class GetUserPreferencesStreamUsecase
    extends BaseStreamUsecase<UserPreferencesEntity?, String> {
  final UserPreferencesRepository repository;
  GetUserPreferencesStreamUsecase({
    required this.repository,
  });
  @override
  Stream<Either<Failure, UserPreferencesEntity?>> callStream(params) async* {
    yield* repository.getPreferencesStream(params);
  }
}
