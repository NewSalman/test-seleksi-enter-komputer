import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/data/repositories/genre_repository_impl.dart';
import 'package:enter_komputer_test/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:enter_komputer_test/features/movies/data/source/local/genre_local_source.dart';
import 'package:enter_komputer_test/features/movies/data/source/local/movie_local_source.dart';
import 'package:enter_komputer_test/features/movies/data/source/remote/genre_remote_source.dart';
import 'package:enter_komputer_test/features/movies/data/source/remote/movie_remote_source.dart';
import 'package:enter_komputer_test/features/movies/domain/repository/genre_repository.dart';
import 'package:enter_komputer_test/features/movies/domain/repository/movie_repository.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/home/home_page_notifier.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/movie_detail/movie_detail_notifier.dart';
import 'package:enter_komputer_test/features/movies/presenter/pages/playlist/playlist_notifier.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:dio/dio.dart';

final GetIt sl = GetIt.instance;


// adding application dependencies
void setup() {
  sl.registerLazySingleton(() {
    final dio = Dio(BaseOptions(baseUrl: Constants.baseURL));
    
    dio.options.headers.addAll(
      { 
        "Authorization" : "Bearer ${Constants.accessToken}",
        "accept" : "application/json"
      }
    );

    dio.interceptors.add(LogInterceptor(
      responseHeader: true,
      requestHeader: true,
      responseBody: true,
      requestBody: true,
    ));

    return dio;
  });

  sl.registerLazySingleton(() => const FlutterSecureStorage());

  sl.registerLazySingleton(() => MovieLocalSource(sl.get<FlutterSecureStorage>()));
  sl.registerLazySingleton(() => MovieRemoteSource(sl.get<Dio>()));

  sl.registerLazySingleton(() => GenreLocalSource(sl.get<FlutterSecureStorage>()));
  sl.registerLazySingleton(() => GenreRemoteSource(sl.get<Dio>()));


  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(sl.get<MovieLocalSource>(), sl.get<MovieRemoteSource>())
  );

  sl.registerLazySingleton<GenreRepository>(
    () => GenreRepositoryImpl(sl.get<GenreRemoteSource>(), sl.get<GenreLocalSource>())
  );


  sl.registerSingleton<HomePageNotifier>(
    HomePageNotifier(sl.get<MovieRepository>(), sl.get<GenreRepository>())
  );

  sl.registerFactory<MovieDetailNotifier>(
    () => MovieDetailNotifier(sl.get<MovieRepository>())
  );

  sl.registerSingleton(PlaylistNotifier(sl.get<MovieRepository>()));
}