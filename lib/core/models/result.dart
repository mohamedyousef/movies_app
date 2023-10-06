import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T, R> with _$Result<T, R> {
  const Result._();

  const factory Result.success(final T data) = _success<T, R>;

  const factory Result.failure(final R error) = _failure<T, R>;

  bool get hasData => maybeWhen(success: (_) => true, orElse: () => false);

  bool get hasError => maybeWhen(failure: (_) => true, orElse: () => false);

  D? ifHasData<D>(D Function(T data) dataFunction) {
    final data = maybeWhen(
      success: (data) => data,
      orElse: () => null,
    );
    if (data != null) {
      return dataFunction(data);
    }
  }
}
