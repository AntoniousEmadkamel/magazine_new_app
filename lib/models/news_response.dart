import 'package:magazine_new_app/models/sources_model.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  String? code;
  String? message;
  List<Articles>? articles;
  NewsResponse({
      this.status,
      this.code,
      this.message,
      this.totalResults,
      this.articles,});

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    code=json['code'];
    message=json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
}
class Articles {
  Sources? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
      this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Sources.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}