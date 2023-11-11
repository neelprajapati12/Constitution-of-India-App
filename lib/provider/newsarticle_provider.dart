import 'dart:convert';

import 'package:constitution_of_india/modal/newsarticles_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsArticleProvider extends ChangeNotifier {
  List? _response = [];
  List? get response => _response;

  getnewsarticles() async {
    try {
      var data = await http.get(Uri.parse(
          "http://mapi.trycatchtech.com/v3/constitution_of_india/constitution_of_india_news_article"));
      if (data.statusCode == 200) {
        final newsdata = jsonDecode(data.body);
        _response = NewsArticlesModal.amendmentsmodal(newsdata)
            .cast<NewsArticlesModal>();
        print(newsdata);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
