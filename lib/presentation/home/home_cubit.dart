import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:konfio_challenge/domain/data/dog_repository.dart';
import 'package:konfio_challenge/domain/entity/dog.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DogRepository _dogRepository;

  HomeCubit(this._dogRepository) : super(const HomeState());

  Future<void> fetchDogs() async {
    emit(state.copyWith(isLoading: true));

    final response = await _dogRepository.fetch();

    final _ = switch (response) {
      Success(:final dogs) => _onSuccess(dogs),
      NetworkError() => _onNetworkError(),
      Failed() => _onUnknownError(),
    };
  }

  void _onSuccess(List<Dog> dogs) {
    emit(state.copyWith(
      isLoading: false,
      dogs: dogs.map(_toState).toList(),
    ));
  }

  void _onNetworkError() {
    emit(state.copyWith(
      isLoading: false,
      error: HomeError.network,
    ));
  }

  void _onUnknownError() {
    emit(state.copyWith(
      isLoading: false,
      error: HomeError.unknown,
    ));
  }

  void didShowError() {
    emit(state.copyWith(
      error: HomeError.none,
    ));
  }

  DogState _toState(Dog dog) {
    return DogState(
      name: dog.name,
      imageUrl: dog.imageUrl,
      description: dog.description,
      age: dog.age,
    );
  }
}
