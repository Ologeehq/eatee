import 'dart:io'; //InternetAddress utility
import 'dart:async'; //For StreamController/Stream

class ConnectivityService {
  static Future<List<InternetAddress>> isConnectedToInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(Duration(seconds: 4));
      return result;
    } on SocketException catch (_) {
      return null;
    } on TimeoutException catch (_) {
      return null;
    }
  }
}
