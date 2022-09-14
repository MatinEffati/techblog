class TagModel {
  String? id;
  String? title;

  TagModel({
    this.id,
    this.title,
  });

  TagModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
  }
}