import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:konfio_challenge/data/datasource/local/dog_dao.dart';
import 'package:konfio_challenge/data/datasource/local/dog_local_dto.dart';
import 'package:konfio_challenge/data/datasource/remote/app_client.dart';
import 'package:konfio_challenge/data/datasource/remote/dog_remote_dto.dart';
import 'package:konfio_challenge/domain/data/dog_repository.dart';

class DogRepositoryImpl implements DogRepository {
  final AppClient _client;
  final DogDao _dogDao;

  DogRepositoryImpl(
    this._client,
    this._dogDao,
  );

  @override
  Future<DogFetchResponse> fetch() async {
    try {
      /// Try loading from cache first
      final cached = await _dogDao.getDogs();
      if (cached.isNotEmpty) {
        return Success(cached.map((dto) => dto.toDomain()).toList());
      }

      /// If cache is empty, fetch from network
      final dogs = await _client.getDogs();
      await _dogDao.insertDogs(dogs.map((dto) => dto.toLocalDto()).toList());
      return Success(dogs.map((dto) => dto.toDomain()).toList());
    } on DioException catch (e, stack) {
      log('failed to get dogs', error: e, stackTrace: stack);
      return const NetworkError();
    } catch (e, stack) {
      log('failed to get dogs', error: e, stackTrace: stack);
      return const Failed();
    }
  }
}
