import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:instbug_task/core/cache/hive_cache_store.dart';
import 'package:instbug_task/features/movies/presentation/view/movie_list_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(HiveCacheStore.boxName);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MovieListScreen(),
    );
  }
}
