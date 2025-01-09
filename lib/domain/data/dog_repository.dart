import 'package:equatable/equatable.dart';
import 'package:konfio_challenge/domain/entity/dog.dart';

abstract interface class DogRepository {
  Future<DogFetchResponse> fetch();
}

sealed class DogFetchResponse extends Equatable {
  const DogFetchResponse();

  @override
  List<Object> get props => [hashCode];
}

class Success extends DogFetchResponse {
  final List<Dog> dogs;

  const Success(this.dogs);

  @override
  List<Object> get props => [dogs];
}

class NetworkError extends DogFetchResponse {
  const NetworkError();
}

class Failed extends DogFetchResponse {
  const Failed();
}
