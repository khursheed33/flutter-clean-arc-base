import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/index.dart';

/// The `BaseUsecase` class is an abstract class that represents a use case in Dart and defines a method
/// for executing the use case.

abstract class BaseUsecase<ReturnType, Params> {
  Future<Either<Failure, ReturnType>> call(Params params);
}

abstract class BaseStreamUsecase<ReturnType, Params> {
  Stream<Either<Failure, ReturnType>> callStream(Params params);
}
