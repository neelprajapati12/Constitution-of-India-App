import 'package:constitution_of_india/helper/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaseStudiesPage extends StatefulWidget {
  final title;
  final description;
  const CaseStudiesPage({this.description, this.title, super.key});

  @override
  State<CaseStudiesPage> createState() => _CaseStudiesPageState();
}

class _CaseStudiesPageState extends State<CaseStudiesPage> {
  double fontSize = 18;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
              70), // Adjust the height to match your custom app bar
          child: CustomAppBars(
            onFontSizeIncrease: () {
              if (fontSize == 18) {
                fontSize = 24;
              } else {
                fontSize = 18;
              }
              setState(() {});
            },
            title: "CASE STUDIES",
            backButtonImage: "assets/image/preamble/back.png",
            shareButtonImage: "assets/image/preamble/TEXT A.png",
            otherActionButtonImage: "assets/image/preamble/share.png",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              vSize(25),
              Center(child: Text(widget.title)),
              vSize(15),
              Image.asset("assets/image/casestudies/SEPARATOR LINE.png"),
              Text(
                widget.description,
                style: TextStyle(fontSize: fontSize),
              )
            ],
          ),
        ),
      ),
    );
  }
}
