import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:constitution_of_india/modal/parts_extended_modal.dart';
import 'package:flutter/material.dart';

class PartsExtended extends StatefulWidget {
  final id;
  final description;
  const PartsExtended({this.description, this.id, super.key});

  @override
  State<PartsExtended> createState() => _PartsExtendedState();
}

class _PartsExtendedState extends State<PartsExtended> {
  List<PartsExtendedModal>? titles = [];

  fetchtitles() async {
    try {
      var title = await http.get(Uri.parse(
          "http://mapi.trycatchtech.com/v3/constitution_of_india/constitution_of_india_articles?part_id=${widget.id}"));
      if (title.statusCode == 200) {
        final titledata = jsonDecode(title.body);
        titles = PartsExtendedModal.partsextendedmodal(titledata)
            .cast<PartsExtendedModal>();
        print(titledata);
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchtitles();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [Text(widget.description)],
      ),
    );
  }
}
