import 'package:dartz/dartz.dart';
import '../../repositories/authentication_repository.dart';
import '../../entities/user_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';

/// The `GetLocalUserUsecase` class is a Dart class that represents a use case for retrieving a local
/// user from an authentication repository.
class GetLocalUserUsecase extends BaseUsecase<UserEntity, String> {
  final AuthenticationRepository repository;
  GetLocalUserUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return await repository.getUser(params);
  }
}
