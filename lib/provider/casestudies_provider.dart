import 'dart:convert';

import 'package:constitution_of_india/modal/casestudies_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CaseStudiesProvider extends ChangeNotifier {
  List? _response = [];
  List? get response => _response;

  getcasestudies() async {
    try {
      var data = await http.get(Uri.parse(
          "http://mapi.trycatchtech.com/v3/constitution_of_india/constitution_of_india_case_study"));
      if (data.statusCode == 200) {
        final casedata = jsonDecode(data.body);
        _response = CaseStudiesModal.casestudiesmodal(casedata)
            .cast<CaseStudiesModal>();
        print(casedata);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
