import 'package:instbug_task/core/models/result.dart';
import 'package:instbug_task/core/network/network_response.dart';
import 'package:instbug_task/features/movies/domain/models/models.dart';
import 'package:instbug_task/features/movies/domain/repositories/movies_repository.dart';

class MoviesInteractor {
  final MoviesRepository _moviesRepository;
  const MoviesInteractor(this._moviesRepository);
  Future<Result<MovieList, NetworkErrorType>> getAllMovies({
    int page = 1,
  }) =>
      _moviesRepository.getAllMovies(page: page);
}
