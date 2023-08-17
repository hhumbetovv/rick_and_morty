// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'char_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharModel _$CharModelFromJson(Map<String, dynamic> json) => CharModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
      created: json['created'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      origin:
          CharLocationModel.fromJson(json['origin'] as Map<String, dynamic>),
      location:
          CharLocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharModelToJson(CharModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'image': instance.image,
      'url': instance.url,
      'created': instance.created,
      'episode': instance.episode,
      'origin': instance.origin,
      'location': instance.location,
    };
