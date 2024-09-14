import 'package:flutter_clean_arc_base/index.dart';

class ConnectivityLocalDatasourceImpl implements ConnectivityLocalDatasource {
  final Connectivity connectivity;

  ConnectivityLocalDatasourceImpl({required this.connectivity});

  @override
  Future<bool> isConnected() async {
    // Check the connectivity result
    final result = await connectivity.checkConnectivity();
    final connected =
        result.firstWhere((element) => element != ConnectivityResult.none);
    "Connection: $connected".log();
    // Return true if result is not ConnectivityResult.none
    return connected != ConnectivityResult.none ? true : false;
  }
}
