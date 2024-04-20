import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

class GetTokenUsecase extends BaseUsecase<String?, NoParams> {
  final AuthenticationRepository repository;
  GetTokenUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, String?>> call(params) async {
    return await repository.getToken();
  }
}
