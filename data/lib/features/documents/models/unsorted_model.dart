import 'package:json_annotation/json_annotation.dart';

part 'unsorted_model.g.dart';

@JsonSerializable()
class UnsortedModel {
  const UnsortedModel({
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory UnsortedModel.fromJson(Map<String, dynamic> json) =>
      _$UnsortedModelFromJson(json);

  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  Map<String, dynamic> toJson() => _$UnsortedModelToJson(this);
}
