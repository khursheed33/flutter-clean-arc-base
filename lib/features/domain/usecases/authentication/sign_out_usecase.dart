import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/features/domain/repositories/authentication_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/usecases/base_usecase.dart';

class SignOutUsecase extends BaseUsecase<void, NoParams> {
  final AuthenticationRepository repository;
  SignOutUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.signOut();
  }
}
