import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

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
