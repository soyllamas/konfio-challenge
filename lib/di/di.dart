import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:konfio_challenge/data/datasource/remote/dog_remote_client.dart';
import 'package:konfio_challenge/data/repository/dog_repository_impl.dart';
import 'package:konfio_challenge/domain/data/dog_repository.dart';
import 'package:konfio_challenge/presentation/home/home_cubit.dart';

final sl = GetIt.instance;

Future<void> registerDependencies() async {
  // Third-party
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DogRemoteClient(sl()));
  // TODO: sl.registerLazySingleton() for floor

  // Data
  sl.registerSingleton<DogRepository>(DogRepositoryImpl(sl()));

  // Presentation
  sl.registerSingleton(HomeCubit(sl()));
}

// TODO: Finish data layer (check claude):
// TODO: - Integrate dio
// TODO: - Integrate retrofit
// TODO: - Integrate floor

// TODO: Add i18n

// TODO: Add Unit Tests

// TODO: Add Readme.md
