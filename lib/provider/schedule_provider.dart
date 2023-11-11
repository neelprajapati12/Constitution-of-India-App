import 'dart:convert';

import 'package:constitution_of_india/modal/schedule_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScheduleProvider extends ChangeNotifier {
  List? _response = [];
  List? get response => _response;
  // String _response = "";
  // String get response => _response;
  getschedules() async {
    try {
      var data = await http.get(Uri.parse(
          "http://mapi.trycatchtech.com/v3/constitution_of_india/constitution_of_india_schedule"));
      if (data.statusCode == 200) {
        final scheduledata = jsonDecode(data.body);
        _response =
            ScheduleModal.schedulemodal(scheduledata).cast<ScheduleModal>();
        print(scheduledata);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
