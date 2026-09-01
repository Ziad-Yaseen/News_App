import 'package:news_app/core/models/source_model.dart';

class ArticleModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String image;
  final String publishedAt;
  final String content;
  final SourceModel source;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    author: json['author'] ?? 'Unknown Author',
    title: json['title'] ?? 'No title available',
    description: json['description'] ?? 'No description available',
    url: json['url'] ?? 'No URL available',
    image: json['urlToImage'] ?? '',
    publishedAt: json['publishedAt'] ?? 'No publish date available',
    content: json['content'] ?? 'No content available',
    source: SourceModel.fromJson(json['source'] ?? {}),
  );
}
