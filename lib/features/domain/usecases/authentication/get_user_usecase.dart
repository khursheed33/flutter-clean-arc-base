import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/features/domain/entities/user_entity.dart';
import 'package:flutter_clean_arc_base/features/domain/repositories/authentication_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';

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
