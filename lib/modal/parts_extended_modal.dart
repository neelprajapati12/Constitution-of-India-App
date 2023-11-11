class PartsExtendedModal {
  String? id;
  String? partId;
  String? title;
  String? smallDescription;
  String? description;

  PartsExtendedModal(
      {this.id,
      this.partId,
      this.title,
      this.smallDescription,
      this.description});

  PartsExtendedModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    partId = json["part_id"];
    title = json["title"];
    smallDescription = json["small_description"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["part_id"] = partId;
    _data["title"] = title;
    _data["small_description"] = smallDescription;
    _data["description"] = description;
    return _data;
  }

  static List partsextendedmodal(List result) {
    return result.map((e) => PartsExtendedModal.fromJson(e)).toList();
  }
}
