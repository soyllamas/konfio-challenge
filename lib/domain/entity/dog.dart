import 'package:equatable/equatable.dart';

class Dog extends Equatable {
  final String name;
  final int age;
  final String description;
  final String imageUrl;

  const Dog({
    required this.name,
    required this.age,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        age,
        description,
        imageUrl,
      ];
}
