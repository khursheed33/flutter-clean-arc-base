import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

/// The `BaseUsecase` class is an abstract class that represents a use case in Dart and defines a method
/// for executing the use case.

abstract class BaseUsecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
