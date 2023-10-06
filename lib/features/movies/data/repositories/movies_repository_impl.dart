import 'package:instbug_task/core/models/result.dart';
import 'package:instbug_task/core/network/network.dart';
import 'package:instbug_task/core/network/network_request.dart';
import 'package:instbug_task/core/network/network_response.dart';
import 'package:instbug_task/features/movies/data/entities/entites.dart';
import 'package:instbug_task/features/movies/data/mapper/mapper.dart';
import 'package:instbug_task/features/movies/domain/models/models.dart';
import 'package:instbug_task/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final NetworkService _networkService;
  final MoviesMapper _moviesMapper;
  const MoviesRepositoryImpl(this._networkService, this._moviesMapper);

  @override
  Future<Result<MovieList, NetworkErrorType>> getAllMovies({
    required int page,
  }) async {
    final NetworkResponse<MovieListEntity> response = await _networkService.request(
      request: NetworkRequest.get(
        endPoint: 'discover/movie',
      )..addQueryParameter('page', '$page'),
      fromJson: MovieListEntity.fromJson,
    );

    return response.when(
      success: (data) {
        final moviesList = _moviesMapper.transformToMoviesList(data);
        if (moviesList != null) {
          return Result.success(moviesList);
        } else {
          return const Result.failure(NetworkErrorType.parsing);
        }
      },
      failure: (error) => Result.failure(error),
    );
  }
}
