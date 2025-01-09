part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<DogState> dogs;
  final HomeError error;

  const HomeState({
    this.isLoading = false,
    this.dogs = const [],
    this.error = HomeError.none,
  });

  HomeState copyWith({
    bool? isLoading,
    List<DogState>? dogs,
    HomeError? error,
  }) =>
      HomeState(
        isLoading: isLoading ?? this.isLoading,
        dogs: dogs ?? this.dogs,
        error: error ?? this.error,
      );

  @override
  List<Object> get props => [
        isLoading,
        dogs,
        error,
      ];
}

class DogState extends Equatable {
  final String name;
  final String imageUrl;
  final String description;
  final int age;

  const DogState({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.age,
  });

  @override
  List<Object?> get props => [
        name,
        imageUrl,
        description,
        age,
      ];
}

enum HomeError {
  none,
  network,
  unknown,
}
