import 'package:json_annotation/json_annotation.dart';

class HomeEverythingEntities {
  String? status;
  int? totalResults;

  @JsonKey(includeFromJson: false, includeIfNull: false)
  List<ArticlesEntities>? articles;

  HomeEverythingEntities({
    this.status,
    this.totalResults,
    this.articles,
  });
}

class ArticlesEntities {
@JsonKey(includeFromJson: false, includeIfNull: false)
  SourceEntities? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticlesEntities({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
}

class SourceEntities {
  String? id;
  String? name;

  SourceEntities({
    this.id,
    this.name,
  });
}
