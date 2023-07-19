import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/core/errors/failure.dart';
import 'package:flutter_clean_arc_base/features/data/sources/local/connectivity/connectivity_local_ds.dart';
import 'package:flutter_clean_arc_base/features/domain/repositories/connectivity_repository.dart';

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
