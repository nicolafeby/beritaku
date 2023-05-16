// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_home_everything_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestHomeEverythingModel _$RequestHomeEverythingModelFromJson(
        Map<String, dynamic> json) =>
    RequestHomeEverythingModel(
      apiKey: json['apiKey'] as String?,
      q: json['q'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      sortBy: json['sortBy'] as String?,
    );

Map<String, dynamic> _$RequestHomeEverythingModelToJson(
        RequestHomeEverythingModel instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'q': instance.q,
      'from': instance.from,
      'to': instance.to,
      'sortBy': instance.sortBy,
    };
