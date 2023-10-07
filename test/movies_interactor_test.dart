import 'package:flutter_test/flutter_test.dart';
import 'package:instbug_task/core/models/result.dart';
import 'package:instbug_task/core/network/network_response.dart';
import 'package:instbug_task/features/movies/domain/interactors/movies_interactor.dart';
import 'package:instbug_task/features/movies/domain/models/models.dart';
import 'package:instbug_task/features/movies/domain/repositories/movies_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movies_interactor_test.mocks.dart';

// Create a mock class for the MethodChannel
class MockMoviesRepository extends Mock implements MoviesRepository {}

@GenerateMocks([MockMoviesRepository])
void main() {
  group('Movies Interactor Test', () {
    late MoviesInteractor moviesInteractor;

    setUp(() {
      moviesInteractor = MoviesInteractor(MockMockMoviesRepository());
    });

    test('when user request to get all movies in page 1', () async {
      const data = MovieList(movies: [], listMeta: ListMeta(currentPage: 1, totalPages: 4024, totalResults: 8060));

      when(moviesInteractor.getAllMovies(page: 1)).thenAnswer((_) async {
        return const Result.success(data);
      });

      final response = await moviesInteractor.getAllMovies(page: 1);

      expect(response.maybeMap(success: (response) => response.data, failure: (failure) => null, orElse: () => null),
          data);
    });

    test("when user request to get all movies but doesn't  have internet connection", () async {
      // Mock a network error response
      when(moviesInteractor.getAllMovies(page: 1)).thenAnswer((_) async {
        return const Result.failure(NetworkErrorType.badConnection);
      });

      final response = await moviesInteractor.getAllMovies(page: 1);

      expect(response.maybeMap(success: (data) => null, failure: (failure) => failure.error, orElse: () => null),
          NetworkErrorType.badConnection);
    });

    test('when user request to get all movies but there is parsing issue', () async {
      // Mock a network error response
      when(moviesInteractor.getAllMovies(page: 1)).thenAnswer((_) async {
        return const Result.failure(NetworkErrorType.parsing);
      });

      final response = await moviesInteractor.getAllMovies(page: 1);

      expect(response.maybeMap(success: (data) => null, failure: (failure) => failure.error, orElse: () => null),
          NetworkErrorType.parsing);
    });

    test("when user request to get all movies but doesn't have authentication", () async {
      // Mock a network error response
      when(moviesInteractor.getAllMovies(page: 1)).thenAnswer((_) async {
        return const Result.failure(NetworkErrorType.notAuthorized);
      });

      final response = await moviesInteractor.getAllMovies(page: 1);

      expect(response.maybeMap(success: (data) => null, failure: (failure) => failure.error, orElse: () => null),
          NetworkErrorType.notAuthorized);
    });
  });
}
