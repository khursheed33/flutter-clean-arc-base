import 'package:dartz/dartz.dart';
import '../../repositories/authentication_repository.dart';
import '../../../../core/params/create_user_params.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';

class CreateUserUsecase extends BaseUsecase<void, CreateUserParams> {
  final AuthenticationRepository repository;
  CreateUserUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.createUser(params);
  }
}
