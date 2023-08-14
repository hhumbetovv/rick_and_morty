import 'package:json_annotation/json_annotation.dart';

part 'character_location_model.g.dart';

@JsonSerializable()
class CharacterLocationModel {
  final String name, url;

  CharacterLocationModel({
    required this.name,
    required this.url,
  });
  Map<String, dynamic> toJson() => _$CharacterLocationModelToJson(this);

  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) => _$CharacterLocationModelFromJson(json);
}
