import 'dart:convert';

import 'package:constitution_of_india/modal/notifications_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationProvider extends ChangeNotifier {
  List? _response = [];
  List? get response => _response;

  getnotifications() async {
    try {
      var data = await http.get(Uri.parse(
          "http://mapi.trycatchtech.com/v3/constitution_of_india/constitution_of_india_notification"));
      if (data.statusCode == 200) {
        final notificationdata = jsonDecode(data.body);
        _response = NotificationModal.notificationsmodal(notificationdata)
            .cast<NotificationModal>();
        print(notificationdata);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
