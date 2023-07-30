import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class BaseUsecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
