import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/features/domain/repositories/authentication_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/usecases/base_usecase.dart';

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
