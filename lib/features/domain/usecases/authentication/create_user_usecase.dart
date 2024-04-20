import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

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
