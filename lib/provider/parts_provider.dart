import 'dart:convert';
import 'package:constitution_of_india/modal/parts_extended_modal.dart';
import 'package:constitution_of_india/modal/parts_modal.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PartsProvider extends ChangeNotifier {
  List<PartsModal>? _response = [];
  List<PartsModal>? get response => _response;

  getparts() async {
    try {
      var data = await http.get(Uri.parse(
          "http://mapi.trycatchtech.com/v3/constitution_of_india/constitution_of_india_parts"));
      if (data.statusCode == 200) {
        final partsdata = jsonDecode(data.body);
        _response = PartsModal.partsmodal(partsdata).cast<PartsModal>();
        print(partsdata);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  // List<PartsExtendedModal>? _titles = [];
  // List<PartsExtendedModal>? get titles => _titles;
}

// getparts() async {
  //   try {
  //     var data = await http.get(Uri.parse(
  //         "http://mapi.trycatchtech.com/v3/constitution_of_india/constitution_of_india_parts"));
  //     if (data.statusCode == 200) {
  //       final partsdata = jsonDecode(data.body);
  //       _response = PartsModal.partsmodal(partsdata).cast<PartsModal>();
  //       print("Number of parts: ${_response!.length}");
  //       for (var part in _response!) {
  //         print(
  //             "Part title: ${part.title}, Small description: ${part.smallDescription}");
  //       }
  //     }
  //     notifyListeners();
  //   } catch (e) {
  //     print(e);
  //   }
  // }