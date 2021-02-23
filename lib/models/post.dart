import 'package:flutterChallenge/utils/dateFormatter.dart';

class Post {
  List<Articles> articles;

  Post({this.articles});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      articles: (json['articles'] as List)
          .map((value) => new Articles.fromJson(value))
          .toList(),
    );
  }
}

class Articles {
  final String id;
  final String name;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Articles({
    this.id,
    this.name,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      id: json['source']["id"],
      name: json['source']["name"],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: DateUtil()
          .formattedDate(DateTime.parse(json['publishedAt']).toLocal()),
      content: json['content'],
    );
  }
}
