import 'package:dartz/dartz.dart';

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  // type [X] is the generic type for the Failure object
  // This must be passed wherever this extension is being called
  Task<Either<X, U>> mapLeftToX<X>() {
    return map(
      (either) => either.leftMap((obj) {
        try {
          return obj as X;
        } catch (e) {
          rethrow;
        }
      }),
    );
  }
}
