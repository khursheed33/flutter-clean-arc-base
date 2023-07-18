import 'package:dartz/dartz.dart';

import '../errors/failure.dart';
import '../utils/safe_api_call.dart';

class SafeApiCallUsecase {
  final SafeApiCall safeApiCall;
  SafeApiCallUsecase({required this.safeApiCall});

  Future<Either<Failure, XType>> call<XType>(
      Future<XType> Function() highOrderFun) async {
    return await safeApiCall.callApi<XType>(
      () async => await highOrderFun(),
    );
  }
}
