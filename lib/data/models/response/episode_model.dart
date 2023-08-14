// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  final int id;
  final String name, air_date, episode, url, created;
  final List<String> characters;

  EpisodeModel({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    required this.url,
    required this.created,
    required this.characters,
  });
  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => _$EpisodeModelFromJson(json);
}
