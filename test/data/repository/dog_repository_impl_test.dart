import 'package:dio/dio.dart';
import 'package:konfio_challenge/data/datasource/local/dog_dao.dart';
import 'package:konfio_challenge/data/datasource/remote/app_client.dart';
import 'package:konfio_challenge/data/datasource/remote/dog_remote_dto.dart';
import 'package:konfio_challenge/data/repository/dog_repository_impl.dart';
import 'package:konfio_challenge/domain/data/dog_repository.dart';
import 'package:konfio_challenge/domain/entity/dog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../test_utils/mocks.dart';

void main() {
  late DogRepository dogRepository;
  late AppClient appClient;
  late DogDao dogDao;

  setUp(() {
    appClient = MockAppClient();
    dogDao = MockDogDao();
    dogRepository = DogRepositoryImpl(
      appClient,
      dogDao,
    );
  });

  group('fetch dogs', () {
    test('successful (from network)', () async {
      final remoteDogDto = DogRemoteDto.fromJson(_json);
      when(() => dogDao.getDogs()).thenAnswer((_) async => []);
      when(() => appClient.getDogs()).thenAnswer((_) async {
        return [remoteDogDto];
      });
      when(() => dogDao.insertDogs([remoteDogDto.toLocalDto()]))
          .thenAnswer((_) async {});

      final response = await dogRepository.fetch();

      expect(
        response,
        const Success([
          Dog(
            name: 'Rex',
            description: 'He is much more passive...',
            age: 5,
            imageUrl: 'https://images.com/dog.jpg',
          ),
        ]),
      );
    });

    test('successful (from cache)', () async {
      when(() => dogDao.getDogs()).thenAnswer((_) async => [
            DogRemoteDto.fromJson(_json).toLocalDto(),
          ]);

      final response = await dogRepository.fetch();

      expect(
        response,
        const Success([
          Dog(
            name: 'Rex',
            description: 'He is much more passive...',
            age: 5,
            imageUrl: 'https://images.com/dog.jpg',
          ),
        ]),
      );
    });

    test('failed (from network error)', () async {
      when(() => dogDao.getDogs()).thenAnswer((_) async => []);
      when(() => appClient.getDogs()).thenThrow(DioException(
        requestOptions: RequestOptions(),
      ));

      final response = await dogRepository.fetch();

      expect(
        response,
        const NetworkError(),
      );
    });

    test('failed (from unknown exception)', () async {
      when(() => dogDao.getDogs()).thenThrow(Exception('Unknown error'));

      final response = await dogRepository.fetch();

      expect(
        response,
        const Failed(),
      );
    });
  });
}

const _json = {
  'dogName': 'Rex',
  'description': 'He is much more passive...',
  'age': 5,
  'image': 'https://images.com/dog.jpg',
};
