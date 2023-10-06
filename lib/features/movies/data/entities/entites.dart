import 'package:json_annotation/json_annotation.dart';

part 'entites.g.dart';

@JsonSerializable()
class MovieListEntity {
  @JsonKey(name: 'results')
  final List<MovieEntity>? data;
  @JsonKey(name: 'page')
  final int? page;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;
  const MovieListEntity(this.data, this.page, this.totalPages, this.totalResults);

  factory MovieListEntity.fromJson(Map<String, dynamic> json) {
    return _$MovieListEntityFromJson(json);
  }
}

@JsonSerializable()
class MovieEntity {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "overview")
  final String? overView;
  @JsonKey(name: "poster_path")
  final String? poster;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  @JsonKey(name: "id")
  final int? id;
  const MovieEntity(this.title, this.overView, this.poster, this.releaseDate, this.id);

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return _$MovieEntityFromJson(json);
  }
}
