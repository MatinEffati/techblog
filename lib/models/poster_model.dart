import 'package:tech_blog/components/api_constants.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    this.id,
    this.title,
    this.image,
  });

  PosterModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = ApiConstants.hostDlUrl+json["image"];
  }
}