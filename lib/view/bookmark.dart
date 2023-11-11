import 'package:constitution_of_india/helper/util.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Bookmark extends StatefulWidget {
  var bookmarklist;
  Bookmark({this.bookmarklist, super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  List bookmarks = [];

  fetchdata() {
    final data = widget.bookmarklist.keys.map((e) {
      final items = widget.bookmarklist.get(e);
      return {"key": e, "bookmark": items["bookmark"]};
    }).toList();
    setState(() {
      bookmarks = data.reversed.toList();
    });
  }

  @override
  void initState() {
    fetchdata();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/background.png"),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text("THE CONSTITUTION OF INDIA"),
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/image/schedule/back.png"),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/image/schedule/seach.png")),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.height * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage("assets/image/notification_input box.png"),
                    fit: BoxFit.fill),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BOOKMARKS",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  hSize(5),
                  Image.asset("assets/image/preamble/bookmark.png")
                ],
              ),
            ),
            bookmarks == null || bookmarks!.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/image/no data.png",
                          color: Colors.black,
                        ),
                        Text(
                          "NO NOTES SAVED",
                          style: TextStyle(fontSize: 30),
                        )
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: bookmarks!.length,
                      itemBuilder: (context, index) {
                        final bookmark = bookmarks![index]["bookmark"];
                        return bookmark != null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.08,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/image/schedule/schedule1_inputbox.png"),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      bookmark,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox
                                .shrink(); // If bookmark is null, return an empty widget
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// fetchdata() {
//     final data = widget.bookmarklist.keys.map((e) {
//       final items = widget.bookmarklist.get(e);
//       return {"key": e, "bookmark": items["bookmark"]};
//     }).toList();

//     // Create a Set to remove duplicate titles
//     final titleSet = Set<String>();

//     for (var item in data) {
//       final title = item["bookmark"];
//       if (title != null && !titleSet.contains(title)) {
//         bookmarks.add(item);
//         titleSet.add(title);
//       }
//     }

//     setState(() {
//       bookmarks = bookmarks.reversed.toList();
//     });
//   }

