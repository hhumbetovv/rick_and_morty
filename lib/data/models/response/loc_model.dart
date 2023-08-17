import 'package:json_annotation/json_annotation.dart';

part 'loc_model.g.dart';

@JsonSerializable()
class LocModel {
  final int id;
  final String name, type, dimension, url, created;
  final List<String> residents;

  LocModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.url,
    required this.created,
    required this.residents,
  });
  Map<String, dynamic> toJson() => _$LocModelToJson(this);

  factory LocModel.fromJson(Map<String, dynamic> json) => _$LocModelFromJson(json);
}
