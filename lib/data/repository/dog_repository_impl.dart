import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:konfio_challenge/data/datasource/remote/dog_remote_client.dart';
import 'package:konfio_challenge/data/datasource/remote/dog_remote_dto.dart';
import 'package:konfio_challenge/domain/data/dog_repository.dart';

class DogRepositoryImpl implements DogRepository {
  final DogRemoteClient _dogRemoteClient;

  DogRepositoryImpl(this._dogRemoteClient);

  @override
  Future<DogFetchResponse> fetch() async {
    try {
      final dogs = await _dogRemoteClient.getDogs();
      return Success(dogs.map((dto) => dto.toDomain()).toList());
    } on DioException {
      return const NetworkError();
    } catch (e, stack) {
      log('failed to get dogs', error: e, stackTrace: stack);
      return const Failed();
    }
  }
}
