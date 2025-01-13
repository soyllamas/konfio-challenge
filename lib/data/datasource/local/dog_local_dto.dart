import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:konfio_challenge/domain/entity/dog.dart';

@Entity(tableName: 'dogs')
class DogLocalDto extends Equatable {
  @primaryKey
  final String name;
  final int age;
  final String description;
  final String imageUrl;

  const DogLocalDto({
    required this.name,
    required this.age,
    required this.description,
    required this.imageUrl,
  });

  @override
  @ignore
  List<Object?> get props => [
        name,
        age,
        description,
        imageUrl,
      ];
}

extension Mapper on DogLocalDto {
  Dog toDomain() {
    return Dog(
      name: name,
      age: age,
      description: description,
      imageUrl: imageUrl,
    );
  }
}
