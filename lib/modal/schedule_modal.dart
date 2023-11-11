class ScheduleModal {
  String? id;
  String? title;
  String? smallDescription;

  ScheduleModal({this.id, this.title, this.smallDescription});

  ScheduleModal.fromJson(Map<String, dynamic> json) {
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

  static List schedulemodal(List result) {
    return result.map((e) => ScheduleModal.fromJson(e)).toList();
  }
}
