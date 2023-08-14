import 'package:json_annotation/json_annotation.dart';

part 'info_model.g.dart';

@JsonSerializable()
class InfoModel {
  final int count, pages;
  final String? next, prev;

  InfoModel({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });
  Map<String, dynamic> toJson() => _$InfoModelToJson(this);

  factory InfoModel.fromJson(Map<String, dynamic> json) => _$InfoModelFromJson(json);
}
