import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
class MovieList with _$MovieList {
  const factory MovieList({
    required List<MovieModel> movies,
    required ListMeta listMeta,
  }) = _MovieList;

  factory MovieList.initial() => const MovieList(
        movies: [],
        listMeta: ListMeta(currentPage: 1, totalPages: 0, totalResults: 0),
      );

  const MovieList._();

  MovieModel operator [](final int index) => movies[index];

  int get length => movies.length;

  bool get isEmpty => movies.isEmpty;

  bool get isNotEmpty => movies.isNotEmpty;

  bool get isLastPage => movies.length < (listMeta.totalResults / listMeta.totalPages);
}

@freezed
class ListMeta with _$ListMeta {
  const factory ListMeta({
    required int currentPage,
    required int totalPages,
    required int totalResults,
  }) = _ListMeta;

  const ListMeta._();
}

@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel({
    required int id,
    required String title,
    required String overView,
    required String releaseDate,
    required ImageModel poster,
  }) = _MovieModel;
}

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required String path,
  }) = _ImageModel;

  const ImageModel._();

  String get originalSize => 'https://image.tmdb.org/t/p/original/$path';

  String get smallSize => 'https://image.tmdb.org/t/p/w500/$path';
}
