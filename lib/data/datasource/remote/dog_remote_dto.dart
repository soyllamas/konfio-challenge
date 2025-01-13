import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:konfio_challenge/data/datasource/local/dog_local_dto.dart';
import 'package:konfio_challenge/domain/entity/dog.dart';

part 'dog_remote_dto.g.dart';

@JsonSerializable()
class DogRemoteDto extends Equatable {
  final String dogName;
  final String description;
  final int age;
  final String image;

  const DogRemoteDto({
    required this.dogName,
    required this.description,
    required this.age,
    required this.image,
  });

  factory DogRemoteDto.fromJson(Map<String, dynamic> json) =>
      _$DogRemoteDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DogRemoteDtoToJson(this);

  @override
  List<Object?> get props => [
        dogName,
        description,
        age,
        image,
      ];
}

extension Mapper on DogRemoteDto {
  Dog toDomain() => Dog(
        name: dogName,
        imageUrl: image,
        description: description,
        age: age,
      );

  DogLocalDto toLocalDto() => DogLocalDto(
        name: dogName,
        age: age,
        description: description,
        imageUrl: image,
      );
}
