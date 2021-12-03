import 'package:meta/meta.dart';
import 'dart:convert';

FavoriteModel favoriteModelFromJson(String str) => FavoriteModel.fromJson(json.decode(str));

class FavoriteModel {
  FavoriteModel({
    required this.favorite,
  });

  List<Favorite> favorite;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
    favorite: List<Favorite>.from(json["favorite"].map((x) => Favorite.fromJson(x))),
  );

}

class Favorite {
  Favorite({
    required this.startupId,
    required this.projectName,
    required this.description,
    required this.presentationLink,
    required this.stage,
    required this.studyFacility,
    required this.userId,
    required this.categoryName,
    required this.createdAt,
    required this.imgLink,
  });

  String startupId;
  String projectName;
  String description;
  String presentationLink;
  String stage;
  String studyFacility;
  String userId;
  String categoryName;
  String createdAt;
  String imgLink;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
    startupId: json["startup_id"],
    projectName: json["project_name"],
    description: json["description"],
    presentationLink: json["presentation_link"],
    stage: json["stage"],
    studyFacility: json["study_facility"],
    userId: json["user_id"],
    categoryName: json["category_name"],
    createdAt: json["created_at"],
    imgLink: json["img_link"],
  );
}
