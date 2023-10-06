import 'package:instbug_task/core/config/config.dart';
import 'package:instbug_task/core/network/network_request.dart';
import 'package:instbug_task/core/network/network_response.dart';

abstract class Interceptor {
  void onRequest(
    NetworkRequest options,
  ) {}
  void onResponse(NetworkRequest request, NetworkNativeResponse networkResponse) {}
}

class QueryAccessKeyInterceptor extends Interceptor {
  @override
  void onRequest(NetworkRequest options) {
    options.queryParameters['api_key'] = apiKey;
  }
}
