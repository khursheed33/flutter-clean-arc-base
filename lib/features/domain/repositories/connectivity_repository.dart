import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

abstract class ConnectivityRepository {
  Future<Either<Failure, bool>> isConnected();
}
