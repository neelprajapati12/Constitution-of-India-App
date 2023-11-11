import 'package:constitution_of_india/helper/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsArticlesPage extends StatefulWidget {
  final title;
  final date;
  final description;
  const NewsArticlesPage({this.date, this.description, this.title, super.key});

  @override
  State<NewsArticlesPage> createState() => _NewsArticlesPageState();
}

class _NewsArticlesPageState extends State<NewsArticlesPage> {
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
            title: "NEWS ARTICLES",
            backButtonImage: "assets/image/preamble/back.png",
            shareButtonImage: "assets/image/preamble/TEXT A.png",
            otherActionButtonImage: "assets/image/preamble/share.png",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                vSize(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            color: Color.fromARGB(255, 17, 170, 213),
                            fontSize: 20),
                      ),
                    ),
                    Text(
                      widget.date,
                      style:
                          TextStyle(color: Color.fromARGB(255, 17, 170, 213)),
                    ),
                  ],
                ),
                vSize(15),
                Image.asset("assets/image/newsarticle/separator line.png"),
                vSize(15),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: fontSize),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
