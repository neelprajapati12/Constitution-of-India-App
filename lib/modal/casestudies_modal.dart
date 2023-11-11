class CaseStudiesModal {
  String? id;
  String? title;
  String? smallDescription;

  CaseStudiesModal({this.id, this.title, this.smallDescription});

  CaseStudiesModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    smallDescription = json["small_description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["small_description"] = smallDescription;
    return _data;
  }

  static List casestudiesmodal(List result) {
    return result.map((e) => CaseStudiesModal.fromJson(e)).toList();
  }
}
