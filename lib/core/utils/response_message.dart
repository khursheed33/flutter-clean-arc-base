import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_base/core/errors/failure.dart';

class ResponseMessage {
  static String? failure(Either<Failure, void> either) {
    return either.fold((l) => l.message, (r) => null);
  }

  static X? success<X>(Either<Failure, X> either) {
    return either.fold((l) => null, (r) => r);
  }
}
