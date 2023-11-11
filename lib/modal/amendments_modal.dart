class AmendmentsModal {
  String? id;
  String? title;
  String? smallDescription;

  AmendmentsModal({this.id, this.title, this.smallDescription});

  AmendmentsModal.fromJson(Map<String, dynamic> json) {
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

  static List amendmentsmodal(List result) {
    return result.map((e) => AmendmentsModal.fromJson(e)).toList();
  }
}
