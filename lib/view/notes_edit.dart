import 'package:constitution_of_india/helper/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NotesEdit extends StatefulWidget {
  final editnote;
  final Function(String) onSave;
  NotesEdit({this.editnote, required this.onSave, super.key});

  @override
  State<NotesEdit> createState() => _NotesEditState();
}

class _NotesEditState extends State<NotesEdit> {
  late TextEditingController editnotes;

  @override
  void initState() {
    super.initState();
    // Initialize the text controller with the provided note text
    editnotes = TextEditingController(text: widget.editnote);
  }

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
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/image/schedule/seach.png"),
                  ),
                )
              ],
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
                    hSize(5),
                    Image.asset("assets/image/drawer/notes_icon.png")
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: editnotes,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          widget.onSave(editnotes.text);
          Navigator.pop(context);
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


// if (editnotes.text.isEmpty) {
//             EasyLoading.showError("Enter a note");
//           } else {
//             HiveStore.createnoteslist({
//               "note": editnotes.text,
//             });
//             // Navigator.pop(context);
//           }
//           setState(() {
//             editnotes.clear();
//           });