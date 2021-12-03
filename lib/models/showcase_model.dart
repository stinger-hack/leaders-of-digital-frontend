// To parse this JSON data, do
//
//     final projectsModel = projectsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProjectsModel projectsModelFromJson(String str) => ProjectsModel.fromJson(json.decode(str));


class ProjectsModel {
  ProjectsModel({
    required this.showcase,
  });

  List<Showcase> showcase;

  factory ProjectsModel.fromJson(Map<String, dynamic> json) => ProjectsModel(
    showcase: List<Showcase>.from(json["showcase"].map((x) => Showcase.fromJson(x))),
  );

}

class Showcase {
  Showcase({
    required this.startupId,
    required this.projectName,
    required this.description,
    required this.presentationLink,
    required this.stage,
    required this.studyFacility,
    required this.userId,
    required this.categoryName,
    required this.imgLink,
    required this.createdAt,
    required this.isLiked,
  });

  String startupId;
  String projectName;
  String description;
  String presentationLink;
  String stage;
  String studyFacility;
  String userId;
  String categoryName;
  String imgLink;
  String createdAt;
  bool isLiked;

  factory Showcase.fromJson(Map<String, dynamic> json) => Showcase(
    startupId: json["startup_id"] ?? '',
    projectName: json["project_name"] ?? '',
    description: json["description"] ?? '',
    presentationLink: json["presentation_link"] ?? '',
    stage: json["stage"] ?? '',
    studyFacility: json["study_facility"] ?? '',
    userId: json["user_id"] ?? '',
    categoryName: json["category_name"] ?? '',
    imgLink: json["img_link"] ?? '',
    createdAt: json["created_at"] ?? '',
    isLiked: json["is_liked"],
  );

}
