import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

/// The `BaseUsecase` class is an abstract class that represents a use case in Dart and defines a method
/// for executing the use case.

abstract class BaseUsecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
