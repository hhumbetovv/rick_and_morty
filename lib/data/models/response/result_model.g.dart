// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: json['results'] as List<dynamic>,
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
