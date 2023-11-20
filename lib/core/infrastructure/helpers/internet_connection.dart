import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionService {
  final Connectivity _connectivity;
  InternetConnectionService(this._connectivity);

  Future<bool> isInternetConnected() async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  Future<T> when<T>({
    required Future<T> Function() onData,
    required Future<T> Function() onError,
  }) async {
    final result = await _connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      try {
        return await onData();
      } catch (e) {
        return onError();
      }
    } else {
      return onError();
    }
  }
}
