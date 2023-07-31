import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../domain/repositories/connectivity_repository.dart';
import '../sources/local/connectivity/connectivity_local_ds.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final ConnectivityLocalDatasource datasource;

  ConnectivityRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, bool>> isConnected() async {
    try {
      final result = await datasource.isConnected();
      return Right(result);
    } catch (err) {
      return left(Failure("Cannot check connection"));
    }
  }
}
