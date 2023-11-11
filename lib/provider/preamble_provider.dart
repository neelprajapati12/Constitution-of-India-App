import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PreambleProvider extends ChangeNotifier {
  List? _response = [];
  List? get response => _response;
  // String _response = "";
  // String get response => _response;
  getpreamble() async {
    try {
      var data = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/constitution_of_india/constitution_of_india_preamble"));
      if (data.statusCode == 200) {
        final preambledata = jsonDecode(data.body);
        _response = preambledata;
        print(preambledata);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
