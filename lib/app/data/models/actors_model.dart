class ActorsModel {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? title;
  String? family;
  String? image;
  String? imageUrl;

  ActorsModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.fullName,
      this.title,
      this.family,
      this.image,
      this.imageUrl});

  ActorsModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["firstName"] is String) firstName = json["firstName"];
    if (json["lastName"] is String) lastName = json["lastName"];
    if (json["fullName"] is String) fullName = json["fullName"];
    if (json["title"] is String) title = json["title"];
    if (json["family"] is String) family = json["family"];
    if (json["image"] is String) image = json["image"];
    if (json["imageUrl"] is String) imageUrl = json["imageUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["fullName"] = fullName;
    data["title"] = title;
    data["family"] = family;
    data["image"] = image;
    data["imageUrl"] = imageUrl;
    return data;
  }
}
