import 'package:konfio_challenge/domain/data/dog_repository.dart';
import 'package:konfio_challenge/domain/entity/dog.dart';

class DogRepositoryImpl implements DogRepository {
  DogRepositoryImpl();

  @override
  Future<DogFetchResponse> fetch() async {
    return const Success([
      Dog(
        name: 'Bulldog',
        imageUrl:
            'https://images.dog.ceo/breeds/schnauzer-giant/n02097130_5117.jpg',
        description:
            'The Bulldog, also known as the British Bulldog or English Bulldog, is a medium-sized breed of dog. It is a muscular, hefty dog with a wrinkled face and a distinctive pushed-in nose.',
        age: 3,
      ),
    ]);
  }
}
