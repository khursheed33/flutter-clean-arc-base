import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

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
