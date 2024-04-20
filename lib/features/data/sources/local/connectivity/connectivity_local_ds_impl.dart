import 'package:flutter_clean_arc_base/index.dart';


class ConnectivityLocalDatasourceImpl implements ConnectivityLocalDatasource {
  final Connectivity connectivity;

  ConnectivityLocalDatasourceImpl({required this.connectivity});
  @override
  Future<bool> isConnected() async {
    return connectivity
        .checkConnectivity()
        .then((value) => value != ConnectivityResult.none);
  }
}
