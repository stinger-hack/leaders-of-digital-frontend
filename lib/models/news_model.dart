import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  NewsModel({
    required this.newsId,
    required this.newsHeader,
    required this.newsText,
    required this.imgLink,
    required this.createdAt,
  });

  String newsId;
  String newsHeader;
  String newsText;
  String imgLink;
  String createdAt;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    newsId: json["news_id"],
    newsHeader: json["news_header"],
    newsText: json["news_text"],
    imgLink: json["img_link"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "news_id": newsId,
    "news_header": newsHeader,
    "news_text": newsText,
    "img_link": imgLink,
  };
}
