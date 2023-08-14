import 'package:json_annotation/json_annotation.dart';

import 'character_location_model.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final int id;
  final String name, status, species, type, gender, image, url, created;
  final List<String> episode;
  final CharacterLocationModel origin, location;

  CharacterModel({
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
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);

  @override
  String toString() {
    return 'CharacterModel{id=$id, name=$name, status=$status, species=$species, type=$type, gender=$gender, image=$image, url=$url, created=$created, episode=$episode, origin=$origin, location=$location}';
  }
}
