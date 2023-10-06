class NetworkRequest {
  final String endPoint;
  Map<String, String> _queryParameters = {};
  Map<String, String> _headers = {};
  final String method;
  String _baseUrl = '';
  NetworkRequest.get({
    required this.endPoint,
  }) : method = "GET";

  void addQueryParameter(String key, String value) {
    _queryParameters[key] = value;
  }

  void addHeader(String key, String value) {
    _headers[key] = value;
  }

  Map<String, dynamic> get queryParameters => _queryParameters;

  Map<String, String> get headers => _headers;
  /* This function converts the object into a Map,
 which is a common data structure that can be easily serialized and passed to native code for further processing.
*/
  Map<String, dynamic> toMap() => {
        "headers": headers,
        "queryParameters": queryParameters,
        "method": method,
        "url": baseUrl,
      };

  set baseUrl(String value) {
    _baseUrl = value;
  }

  String get baseUrl {
    String url = endPoint;
    String query = '';

    if (!url.startsWith(RegExp(r'https?:'))) {
      url = _baseUrl + url;
      final s = url.split(':/');
      if (s.length == 2) {
        url = '${s[0]}:/${s[1].replaceAll('//', '/')}';
      }
    }

    if (queryParameters.isNotEmpty) query = _foldParameters();

    if (query.isNotEmpty) {
      url += (url.contains('?') ? '&' : '?') + query.toString();
    }
    // Normalize the url.
    return Uri.parse(url).normalizePath().toString();
  }

  String _foldParameters() {
    String query = '';
    for (final item in queryParameters.entries) {
      query += '${item.key}=${item.value}&';
    }
    return query.substring(0, query.length - 1);
  }
}
