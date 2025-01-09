// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_remote_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogRemoteDto _$DogRemoteDtoFromJson(Map<String, dynamic> json) => DogRemoteDto(
      dogName: json['dogName'] as String,
      description: json['description'] as String,
      age: (json['age'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$DogRemoteDtoToJson(DogRemoteDto instance) =>
    <String, dynamic>{
      'dogName': instance.dogName,
      'description': instance.description,
      'age': instance.age,
      'image': instance.image,
    };
