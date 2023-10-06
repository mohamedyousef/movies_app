import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instbug_task/core/config/config.dart';
import 'package:instbug_task/core/network/interceptor.dart';
import 'package:instbug_task/core/network/network.dart';
import 'package:instbug_task/features/movies/data/mapper/mapper.dart';
import 'package:instbug_task/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:instbug_task/features/movies/domain/interactors/movies_interactor.dart';
import 'package:instbug_task/features/movies/domain/repositories/movies_repository.dart';
import 'package:instbug_task/features/movies/presentation/viewmodel/movie_list_view_model.dart';

enum Enviroment { dev, staging, prod }

final baseUrlProvider = Provider((ref) {
  switch (enviroment) {
    case Enviroment.dev:
      return baseUrlDev;
    case Enviroment.staging:
      return baseUrlStaging;
    case Enviroment.prod:
      return baseUrlProd;
  }
});

final networkServiceProvider = Provider(
  (ref) {
    return NetworkService(
      baseUrlBuilder: () async => ref.watch(baseUrlProvider),
    )..addInterceptor(QueryAccessKeyInterceptor());
  },
);

final _moviesMapper = Provider<MoviesMapper>((ref) {
  return MoviesMapper();
});

final _moviesRepository = Provider<MoviesRepository>((ref) {
  return MoviesRepositoryImpl(ref.watch(networkServiceProvider), ref.watch(_moviesMapper));
});

final _moviesInteractor = Provider<MoviesInteractor>((ref) {
  return MoviesInteractor(ref.watch(_moviesRepository));
});
final movieListViewModelProvider = Provider<MovieListViewModel>((ref) {
  return MovieListViewModel(ref.watch(_moviesInteractor));
});
