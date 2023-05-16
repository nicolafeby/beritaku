import 'package:beritaku/domain/home_everything/entities/home_everything_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_everything_model.g.dart';

@JsonSerializable()
class HomeEverythingModel extends HomeEverythingEntities {
  @JsonKey(name: 'articles')
  final List<ArticlesModel>? articlesModel;

  HomeEverythingModel({
    required String? status,
    required int? totalResults,
    required this.articlesModel,
  }) : super(
          status: status,
          totalResults: totalResults,
          articles: articlesModel,
        );

  factory HomeEverythingModel.fromJson(Map<String, dynamic> json) =>
      _$HomeEverythingModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeEverythingModelToJson(this);
}

@JsonSerializable()
class ArticlesModel extends ArticlesEntities {
  @JsonKey(name: 'source')
  final SourceModel? sourceModel;

  ArticlesModel({
    required this.sourceModel,
    required String? author,
    required String? title,
    required String? description,
    required String? url,
    required String? urlToImage,
    required String? publishedAt,
    required String? content,
  }) : super(
          source: sourceModel,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticlesModel.fromJson(Map<String, dynamic> json) =>
      _$ArticlesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesModelToJson(this);
}

@JsonSerializable()
class SourceModel extends SourceEntities {
  SourceModel({
    required String? id,
    required String? name,
  }) : super(
          id: id,
          name: name,
        );

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);
}
