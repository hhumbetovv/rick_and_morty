// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocModel _$LocModelFromJson(Map<String, dynamic> json) => LocModel(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      dimension: json['dimension'] as String,
      url: json['url'] as String,
      created: json['created'] as String,
      residents:
          (json['residents'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LocModelToJson(LocModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'dimension': instance.dimension,
      'url': instance.url,
      'created': instance.created,
      'residents': instance.residents,
    };
