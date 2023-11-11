class NewsArticlesModal {
  String? id;
  String? title;
  String? date;
  String? smallDescription;

  NewsArticlesModal({this.id, this.title, this.date, this.smallDescription});

  NewsArticlesModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    date = json["date"];
    smallDescription = json["small_description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["date"] = date;
    _data["small_description"] = smallDescription;
    return _data;
  }

  static List amendmentsmodal(List result) {
    return result.map((e) => NewsArticlesModal.fromJson(e)).toList();
  }
}
