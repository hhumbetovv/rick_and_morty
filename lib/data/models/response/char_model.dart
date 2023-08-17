import 'package:json_annotation/json_annotation.dart';

import 'char_location_model.dart';

part 'char_model.g.dart';

@JsonSerializable()
class CharModel {
  final int id;
  final String name, status, species, type, gender, image, url, created;
  final List<String> episode;
  final CharLocationModel origin, location;

  CharModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.url,
    required this.created,
    required this.episode,
    required this.origin,
    required this.location,
  });
  Map<String, dynamic> toJson() => _$CharModelToJson(this);

  factory CharModel.fromJson(Map<String, dynamic> json) => _$CharModelFromJson(json);
}
