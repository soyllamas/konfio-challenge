import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:konfio_challenge/data/datasource/local/app_database.dart';
import 'package:konfio_challenge/data/datasource/remote/app_client.dart';
import 'package:konfio_challenge/data/repository/dog_repository_impl.dart';
import 'package:konfio_challenge/domain/data/dog_repository.dart';
import 'package:konfio_challenge/presentation/home/home_cubit.dart';

final sl = GetIt.instance;

Future<void> registerDependencies() async {
  // Initialize Dependencies
  final database = await $FloorAppDatabase.databaseBuilder('app.db').build();

  // Third-party
  sl.registerSingleton(Dio());
  sl.registerSingleton(AppClient(sl()));
  sl.registerSingleton(database.dogDao);

  // Data
  sl.registerSingleton<DogRepository>(DogRepositoryImpl(sl(), sl()));

  // Presentation
  sl.registerFactory(() => HomeCubit(sl()));
}

// TODO: Add i18n

// TODO: Add Unit Tests

// TODO: Add Readme.md
