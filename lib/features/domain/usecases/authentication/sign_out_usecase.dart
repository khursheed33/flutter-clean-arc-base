import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

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
