import 'package:enter_komputer_test/core/utils/constant.dart';
import 'package:enter_komputer_test/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:enter_komputer_test/features/movies/data/source/local/movie_local_source.dart';
import 'package:enter_komputer_test/features/movies/data/source/remote/movie_remote_source.dart';
import 'package:enter_komputer_test/features/movies/domain/repository/movie_repository.dart';
import 'package:get_it/get_it.dart';

import 'package:dio/dio.dart';

final GetIt sl = GetIt.instance;


// adding application dependencies
void setup() {
  sl.registerLazySingleton(() {
    final dio = Dio(BaseOptions(baseUrl: Constants.baseURL));

    dio.interceptors.add(LogInterceptor(
      responseHeader: true,
      requestHeader: true,
      responseBody: true,
      requestBody: true,
    ));
    
    return dio;
  });

  sl.registerLazySingleton(() => MovieLocalSource());
  sl.registerLazySingleton(() => MovieRemoteSource(sl.get<Dio>()));


  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(sl.get<MovieLocalSource>(), sl.get<MovieRemoteSource>()));
}