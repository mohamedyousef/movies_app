class NetworkResponse<T> {
  final bool _isSuccess;
  final T? _data;
  final NetworkErrorType? _errorType;
  final int? statusCode;

  NetworkResponse(
    this._isSuccess,
    this.statusCode, [
    this._data,
    this._errorType,
  ]);

  factory NetworkResponse.success({
    required int? statusCode,
    required T? data,
  }) {
    return NetworkResponse<T>(true, statusCode, data);
  }

  factory NetworkResponse.failure({
    required int? statusCode,
    required NetworkErrorType errorType,
  }) {
    return NetworkResponse(false, statusCode, null, errorType);
  }

  R when<R>({
    required R Function(T data) success,
    required R Function(NetworkErrorType networkErrorType) failure,
  }) {
    if (_isSuccess) {
      if (_data != null) {
        return success(_data!);
      } else {
        return success(true as T);
      }
    } else {
      return failure(_errorType!);
    }
  }

  T? get data => _data;
  NetworkErrorType? get errorType => _errorType;
}

enum NetworkErrorType { parsing, notAuthorized, badConnection, internalServerError, other }

class NetworkNativeResponse {
  NetworkNativeResponse({
    this.data,
    this.statusCode,
  });

  /// Response body from native as string
  final String? data;

  /// Http status code from native
  int? statusCode;

  factory NetworkNativeResponse.fromMap(Map<String, dynamic> response) => NetworkNativeResponse(
        data: response['data'],
        statusCode: response['statusCode'],
      );
}
