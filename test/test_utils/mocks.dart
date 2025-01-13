import 'package:konfio_challenge/data/datasource/local/dog_dao.dart';
import 'package:konfio_challenge/data/datasource/remote/app_client.dart';
import 'package:mocktail/mocktail.dart';

class MockAppClient extends Mock implements AppClient {}

class MockDogDao extends Mock implements DogDao {}
