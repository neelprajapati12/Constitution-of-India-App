class NotificationModal {
  String? id;
  String? title;
  String? smallDescription;

  NotificationModal({this.id, this.title, this.smallDescription});

  NotificationModal.fromJson(Map<String, dynamic> json) {
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

  static List notificationsmodal(List result) {
    return result.map((e) => NotificationModal.fromJson(e)).toList();
  }
}
