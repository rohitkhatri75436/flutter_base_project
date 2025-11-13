import '../../router/export.dart';

class ConnectionValidator {
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } /*else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      return true;
    }*/
    return false;
  }
}
