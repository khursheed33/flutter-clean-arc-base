import 'package:dartz/dartz.dart';
import '../../repositories/authentication_repository.dart';
import '../../entities/user_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';

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
