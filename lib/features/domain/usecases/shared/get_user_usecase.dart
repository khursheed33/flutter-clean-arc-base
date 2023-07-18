import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/features/domain/repositories/authentication_repository.dart';
import '../../entities/user_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';

class GetLocalInstituteUsecase extends BaseUsecase<UserEntity, String> {
  final AuthenticationRepository repository;
  GetLocalInstituteUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return await repository.getUser(params);
  }
}
