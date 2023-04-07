// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsorted_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsortedModel _$UnsortedModelFromJson(Map<String, dynamic> json) =>
    UnsortedModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$UnsortedModelToJson(UnsortedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
