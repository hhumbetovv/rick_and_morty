import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final int id;
  final String name, type, dimension, url, created;
  final List<String> residents;

  LocationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.url,
    required this.created,
    required this.residents,
  });
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
}
