// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_home_headline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestHomeHeadlineModel _$RequestHomeHeadlineModelFromJson(
        Map<String, dynamic> json) =>
    RequestHomeHeadlineModel(
      apiKey: json['apiKey'] as String?,
      country: json['country'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$RequestHomeHeadlineModelToJson(
        RequestHomeHeadlineModel instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'country': instance.country,
      'language': instance.language,
    };
