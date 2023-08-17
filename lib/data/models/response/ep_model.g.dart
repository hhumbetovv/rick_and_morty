// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ep_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpModel _$EpModelFromJson(Map<String, dynamic> json) => EpModel(
      id: json['id'] as int,
      name: json['name'] as String,
      air_date: json['air_date'] as String,
      episode: json['episode'] as String,
      url: json['url'] as String,
      created: json['created'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$EpModelToJson(EpModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.air_date,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
      'characters': instance.characters,
    };
