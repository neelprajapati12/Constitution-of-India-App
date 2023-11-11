import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Widget vSize(double size) {
  return SizedBox(height: size);
}

Widget hSize(double size) {
  return SizedBox(width: size);
}

class BaseModal {
  String name;
  String image;
  Function onTap;

  BaseModal({required this.image, required this.name, required this.onTap});
}

class HiveStore {
  static final noteslist = Hive.box("notes_list");

  static createnoteslist(Map<String, dynamic> notesinfo) async {
    await noteslist.add(notesinfo);
    print("note - ${noteslist.length}");
  }

  static final bookmarklist = Hive.box("notes_list");

  static createbookmarklist(Map<String, dynamic> bookmarkinfo) async {
    await bookmarklist.add(bookmarkinfo);
    print("note - ${bookmarklist.length}");
  }
}

class TextSize {
  double textSize = 18.0; // Initial text size
  double titleSize = 25.0; // Initial title text size

  void increaseTextSize() {
    textSize += 2.0; // Increase the text size by 2.0
    titleSize += 2.0; // Increase the title text size by 2.0
  }
}

class CustomAppBars extends StatelessWidget {
  final String title;
  final String backButtonImage;
  final String shareButtonImage;
  final String otherActionButtonImage;
  final Function? onFontSizeIncrease;

  CustomAppBars({
    required this.title,
    required this.backButtonImage,
    required this.shareButtonImage,
    required this.otherActionButtonImage,
    this.onFontSizeIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/preamble/highlight.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(backButtonImage),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  onFontSizeIncrease!();
                },
                child: Image.asset(
                  shareButtonImage,
                  width: 30,
                  height: 30,
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  // Handle the other action button action here
                  // Implement your other action functionality
                },
                child: Image.asset(
                  otherActionButtonImage,
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
