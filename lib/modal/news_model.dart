import 'package:news_app/modal/source_model.dart';

class NewsModel {
  final String source;
  final String title;
  final String description;
  final String image;
  final DateTime time;

  NewsModel(
      {required this.source,
      required this.title,
      required this.description,
      required this.image,
      required this.time});
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      source: json["source"]['name'],
      title: json['title'],
      description: json['description'],
      image: json['urlToImage'],
      time: DateTime.parse(json['publishedAt']),
    );
  }
  toFireStore() {
    return {
      'source': source,
      'title': title,
      'description': description,
      "urlToImage": image,
      'publishedAt': time,
    };
  }
}
