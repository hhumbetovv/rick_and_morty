import 'package:json_annotation/json_annotation.dart';

import 'info_model.dart';

part 'result_model.g.dart';

@JsonSerializable()
class ResultModel {
  final InfoModel info;
  final List results;

  ResultModel({
    required this.info,
    required this.results,
  });
  Map<String, dynamic> toJson() => _$ResultModelToJson(this);

  factory ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);
}
