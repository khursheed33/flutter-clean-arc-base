import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/core/params/sign_in_params.dart';
import 'package:flutter_clean_arc_base/features/domain/repositories/authentication_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';

class SignInUsecase extends BaseUsecase<String, SignInParams> {
  final AuthenticationRepository repository;
  SignInUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.signIn(
      username: params.username,
      password: params.password,
    );
  }
}
