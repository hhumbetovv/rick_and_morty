import 'package:json_annotation/json_annotation.dart';

part 'char_location_model.g.dart';

@JsonSerializable()
class CharLocationModel {
  final String name, url;

  CharLocationModel({
    required this.name,
    required this.url,
  });
  Map<String, dynamic> toJson() => _$CharLocationModelToJson(this);

  factory CharLocationModel.fromJson(Map<String, dynamic> json) => _$CharLocationModelFromJson(json);
}
