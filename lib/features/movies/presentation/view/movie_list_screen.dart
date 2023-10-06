import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinte_scrolling/infinte_scrolling.dart';
import 'package:instbug_task/di_module/di_module.dart';
import 'package:instbug_task/features/movie_details/presentation/view/move_details_screen.dart';
import 'package:instbug_task/features/movies/domain/models/models.dart';
import 'package:instbug_task/ui_components/image_network.dart';

class MovieListScreen extends ConsumerWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Popular Movies'),
      ),
      body: const _MovieListView(),
    );
  }
}

class _MovieListView extends ConsumerWidget {
  const _MovieListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieListViewModelProvider);

    return PaginationGridView<int, MovieModel>(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      controller: state,
      padding: const EdgeInsets.all(10),
      firstPageProgressIndicator: (context) => const Center(
        child: CircularProgressIndicator(
          strokeWidth: 1.2,
        ),
      ),
      itemWidgetBuilder: (context, item, index) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProviderScope(
                  overrides: [singleMovieModelProvider.overrideWithValue(item)], child: const MovieDetailScreen()),
            ),
          ),
          child: ImageNetwork(
            item.poster.smallSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
