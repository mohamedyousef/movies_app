import 'package:instbug_task/core/models/result.dart';
import 'package:instbug_task/core/network/network_response.dart';
import 'package:instbug_task/features/movies/domain/models/models.dart';

abstract class MoviesRepository {
  Future<Result<MovieList, NetworkErrorType>> getAllMovies({
    required int page,
  });
}
