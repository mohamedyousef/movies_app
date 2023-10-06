import 'package:collection/collection.dart';
import 'package:instbug_task/features/movies/data/entities/entites.dart';
import 'package:instbug_task/features/movies/domain/models/models.dart';

class MoviesMapper {
  MovieList? transformToMoviesList(MovieListEntity movieListEntity) {
    final currentPage = movieListEntity.page;
    final totalPages = movieListEntity.totalPages;
    final totalResults = movieListEntity.totalResults;
    final movies = movieListEntity.data?.map(transoformToMovieModel).whereNotNull().toList();
    if (currentPage == null || totalPages == null || totalResults == null || movies == null) return null;
    return MovieList(
        movies: movies,
        listMeta: ListMeta(currentPage: currentPage, totalPages: totalPages, totalResults: totalResults));
  }

  MovieModel? transoformToMovieModel(MovieEntity movieEntity) {
    final title = movieEntity.title;
    final id = movieEntity.id;
    final poster = movieEntity.poster;
    final overView = movieEntity.overView;
    final releaseDate = movieEntity.releaseDate;

    if (title == null || id == null || overView == null || releaseDate == null || poster == null) return null;
    return MovieModel(
      id: id,
      title: title,
      overView: overView,
      releaseDate: releaseDate,
      poster: ImageModel(path: poster),
    );
  }
}
