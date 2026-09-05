import 'package:easy_localization/easy_localization.dart';
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

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    String formattedDate = '';
    final parsedDate = DateTime.tryParse(json['publishedAt'] ?? '');

    if (parsedDate != null) {
      formattedDate = DateFormat('yyyy-MM-dd HH:mm')
          .format(parsedDate.toLocal());
    }

    return ArticleModel(
      author: json['author'] ?? 'Unknown Author',
      title: json['title'] ?? 'No title available',
      description: json['description'] ?? 'No description available',
      url: json['url'] ?? 'No URL available',
      image: json['urlToImage'] ?? '',
      publishedAt: formattedDate,
      content: json['content'] ?? 'No content available',
      source: SourceModel.fromJson(json['source'] ?? {}),
    );
  }
}
