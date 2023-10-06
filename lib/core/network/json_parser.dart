import 'dart:convert';

class JsonParser {
  T? parse<T, K>(dynamic data, K Function(Map<String, dynamic>)? fromJson) {
    T? t;
    data = jsonDecode(data);
    try {
      if (data != null) {
        if (data is Iterable) {
          t = _fromJsonList(data as List<dynamic>, fromJson) as T;
        } else if (data is Map && fromJson != null) {
          t = fromJson(data as Map<String, dynamic>) as T;
        }
      }
    } catch (e) {
      return null;
    }
    return t;
  }

  List<T> _fromJsonList<T>(List<dynamic> listOfData, T Function(Map<String, dynamic>)? fromJson) {
    final List<T> list = <T>[];
    if (fromJson != null) {
      for (final element in listOfData) {
        list.add(fromJson(element));
      }
    } else {
      return listOfData.cast<T>();
    }
    return list;
  }
}
