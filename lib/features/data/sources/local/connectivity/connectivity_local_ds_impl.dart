import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_clean_arc_base/features/data/sources/local/connectivity/connectivity_local_ds.dart';

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
