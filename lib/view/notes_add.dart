import 'package:constitution_of_india/helper/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NotesAddPage extends StatefulWidget {
  const NotesAddPage({super.key});

  @override
  State<NotesAddPage> createState() => _NotesAddPageState();
}

class _NotesAddPageState extends State<NotesAddPage> {
  final addnote = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/background.png"),
                fit: BoxFit.cover)),
        child: Column(
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
            ),
            Container(
              width: MediaQuery.of(context).size.height * 0.7,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/notification_input box.png"),
                  // fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "NOTES",
                      style: TextStyle(fontSize: 25),
                    ),
                    Image.asset("assets/image/drawer/notes_icon.png")
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: addnote,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (addnote.text.isEmpty) {
            EasyLoading.showError("Enter a note");
          } else {
            HiveStore.createnoteslist({
              "note": addnote.text,
            });
            // Navigator.pop(context);
          }
          setState(() {
            addnote.clear();
          });
        },
        label: Text(
          "Save",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
