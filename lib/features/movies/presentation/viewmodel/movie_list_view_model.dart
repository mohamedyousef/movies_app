import 'package:infinte_scrolling/infinte_scrolling.dart';
import 'package:instbug_task/features/movies/domain/interactors/movies_interactor.dart';
import 'package:instbug_task/features/movies/domain/models/models.dart';

class MovieListViewModel extends PaginationController<int, MovieModel> {
  final MoviesInteractor _moviesInteractor;

  MovieListViewModel(this._moviesInteractor);

  @override
  Future<void> fetchPage(int? pageKey) async {
    try {
      final response = await _moviesInteractor.getAllMovies(
        page: pageKey ?? 1,
      );

      response.when(
        success: (data) {
          if (data.isLastPage) {
            appendLastPage(data.movies);
          } else {
            int nextPageKey = pageKey ?? 1;
            appendPage(data.movies, nextPageKey + 1);
          }
        },
        failure: (failure) => showError(failure),
      );
    } catch (e) {
      showError(e);
    }
  }
}
