import 'package:json_annotation/json_annotation.dart';
part 'request_home_everything_model.g.dart';

@JsonSerializable()
class RequestHomeEverythingModel {
  final String? apiKey;
  final String? q;
  final String? from;
  final String? to;
  final String? sortBy;

  RequestHomeEverythingModel({
    this.apiKey,
    this.q,
    this.from,
    this.to,
    this.sortBy,
  });

  factory RequestHomeEverythingModel.fromJson(Map<String, dynamic> json) =>
      _$RequestHomeEverythingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestHomeEverythingModelToJson(this);
}
