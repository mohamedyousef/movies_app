import 'package:instbug_task/core/config/config.dart';
import 'package:instbug_task/core/network/network_request.dart';

abstract class Interceptor {
  void onRequest(
    NetworkRequest options,
  );
}

class QueryAccessKeyInterceptor extends Interceptor {
  @override
  void onRequest(NetworkRequest options) {
    options.queryParameters['api_key'] = apiKey;
  }
}
