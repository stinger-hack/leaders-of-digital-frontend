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

  Map<String, dynamic> toJson() => {
    "showcase": List<dynamic>.from(showcase.map((x) => x.toJson())),
  };
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

  factory Showcase.fromJson(Map<String, dynamic> json) => Showcase(
    startupId: json["startup_id"],
    projectName: json["project_name"],
    description: json["description"],
    presentationLink: json["presentation_link"],
    stage: json["stage"],
    studyFacility: json["study_facility"],
    userId: json["user_id"],
    categoryName: json["category_name"],
    imgLink: json["img_link"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "startup_id": startupId,
    "project_name": projectName,
    "description": description,
    "presentation_link": presentationLink,
    "stage": stage,
    "study_facility": studyFacility,
    "user_id": userId,
    "category_name": categoryName,
  };
}
