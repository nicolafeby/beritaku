import 'package:json_annotation/json_annotation.dart';
part 'request_home_headline_model.g.dart';

@JsonSerializable()
class RequestHomeHeadlineModel {
  final String? apiKey;
  final String? country;
  final String? language;
  final String? category;

  RequestHomeHeadlineModel({
    this.apiKey,
    this.country,
    this.language,
    this.category,
  });

  factory RequestHomeHeadlineModel.fromJson(Map<String, dynamic> json) =>
      _$RequestHomeHeadlineModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestHomeHeadlineModelToJson(this);
}
