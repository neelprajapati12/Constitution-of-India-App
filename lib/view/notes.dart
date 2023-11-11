import 'package:constitution_of_india/helper/util.dart';
import 'package:constitution_of_india/view/notes_add.dart';
import 'package:constitution_of_india/view/notes_edit.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  var notelist;
  Notes({this.notelist, super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List notes = [];

  fetchdata() {
    final data = widget.notelist.keys.map((e) {
      final items = widget.notelist.get(e);
      return {"key": e, "note": items["note"]};
    }).toList();
    setState(() {
      notes = data.reversed.toList();
    });
  }

  String? originalNote;
  void _handleNoteSaved(String editedNote) {
    // Update the state of the previous screen with the edited note
    setState(() {
      originalNote =
          editedNote; // Assuming originalNote is a variable that holds the note text
    });
  }

  @override
  void initState() {
    fetchdata();
    print(notes);
    super.initState();
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
            notes == null || notes.isEmpty
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
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index]["note"];
                        if (note != null) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NotesEdit(
                                              editnote: originalNote,
                                              onSave: _handleNoteSaved,
                                            )));
                              },
                              child: Card(
                                elevation: 0,
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      note,
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/image/preamble/SEPARATOR LINE.png",
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return SizedBox
                              .shrink(); // If note is null, return an empty widget
                        }
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NotesAddPage()));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 50,
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// notes == null || notes.isEmpty
            //     ? Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Column(
            //           children: [
            //             Image.asset(
            //               "assets/image/no data.png",
            //               color: Colors.black,
            //             ),
            //             Text(
            //               "NO NOTES SAVED",
            //               style: TextStyle(fontSize: 30),
            //             )
            //           ],
            //         ),
            //       )
            //     : Expanded(
            //         child: ListView.builder(
            //           itemCount: notes.length,
            //           itemBuilder: (context, index) {
            //             return Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: GestureDetector(
            //                 onTap: () {},
            //                 child: Card(
            //                   elevation: 0,
            //                   color: Colors.transparent,
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         notes[index]["note"].toString() ??
            //                             "No Note Available",
            //                         style: TextStyle(
            //                             fontSize: 25, color: Colors.white),
            //                       ),
            //                       Image.asset(
            //                         "assets/image/preamble/SEPARATOR LINE.png",
            //                         color: Colors.white,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       ),