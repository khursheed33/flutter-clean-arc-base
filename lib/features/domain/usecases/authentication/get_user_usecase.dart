import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

class GetUserUsecase extends BaseUsecase<UserEntity, String> {
  final AuthenticationRepository repository;
  GetUserUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return await repository.getUser(params);
  }
}
