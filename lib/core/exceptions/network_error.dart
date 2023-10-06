import 'package:instbug_task/core/network/network_response.dart';

class NetworkError implements Exception {
  NetworkError({
    this.response,
    this.type = NetworkErrorType.other,
    this.error,
  });

  /// Response info, it may be `null` if the request can't reach to
  /// the http server, for example, occurring a dns error, network is not available.
  NetworkNativeResponse? response;

  NetworkErrorType type;

  /// The original error/exception object; It's usually not null when `type`
  /// is DioErrorType.other
  dynamic error;

  StackTrace? _stackTrace;

  set stackTrace(StackTrace? stack) => _stackTrace = stack;

  StackTrace? get stackTrace => _stackTrace;

  String get message => (error?.toString() ?? '');

  @override
  String toString() {
    var msg = 'NetworkError [$type]: $message';
    if (error is Error) {
      msg += '\n${(error as Error).stackTrace}';
    }
    if (_stackTrace != null) {
      msg += '\nSource stack:\n$stackTrace';
    }
    return msg;
  }
}
