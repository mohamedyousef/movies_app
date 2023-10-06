import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instbug_task/features/movies/presentation/view/movie_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular Movies',
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MovieListScreen(),
    );
  }
}
