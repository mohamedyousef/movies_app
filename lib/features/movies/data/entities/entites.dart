import 'package:json_annotation/json_annotation.dart';

part 'entites.g.dart';

@JsonSerializable()
class MovieListEntity {
  @JsonKey(name: 'results')
  final List<MovieEntity>? data;
  const MovieListEntity(this.data);

  factory MovieListEntity.fromJson(Map<String, dynamic> json) {
    return _$MovieListEntityFromJson(json);
  }
}

@JsonSerializable()
class MovieEntity {
  final String? title;
  final String? overView;
  final String? poster;
  final String? releaseDate;
  final int? id;
  const MovieEntity(this.title, this.overView, this.poster, this.releaseDate, this.id);

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return _$MovieEntityFromJson(json);
  }
}
