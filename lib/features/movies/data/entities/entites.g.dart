// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListEntity _$MovieListEntityFromJson(Map<String, dynamic> json) =>
    MovieListEntity(
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int?,
      json['total_pages'] as int?,
      json['total_results'] as int?,
    );

Map<String, dynamic> _$MovieListEntityToJson(MovieListEntity instance) =>
    <String, dynamic>{
      'results': instance.data,
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) => MovieEntity(
      json['title'] as String?,
      json['overview'] as String?,
      json['poster_path'] as String?,
      json['release_date'] as String?,
      json['id'] as int?,
    );

Map<String, dynamic> _$MovieEntityToJson(MovieEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'overview': instance.overView,
      'poster_path': instance.poster,
      'release_date': instance.releaseDate,
      'id': instance.id,
    };
