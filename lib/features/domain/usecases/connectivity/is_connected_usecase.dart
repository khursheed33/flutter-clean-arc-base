import 'package:dartz/dartz.dart';
import '../../repositories/connectivity_repository.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/usecases/base_usecase.dart';

class IsConnectedUsecase extends BaseUsecase<bool, NoParams> {
  final ConnectivityRepository repository;
  IsConnectedUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, bool>> call(params) async {
    return await repository.isConnected();
  }
}
