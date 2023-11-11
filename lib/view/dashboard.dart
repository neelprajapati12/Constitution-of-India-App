import 'package:constitution_of_india/helper/textstyles.dart';
import 'package:constitution_of_india/helper/util.dart';
import 'package:constitution_of_india/view/amendments.dart';
import 'package:constitution_of_india/view/bookmark.dart';
import 'package:constitution_of_india/view/casestudies.dart';
import 'package:constitution_of_india/view/newsarticles.dart';
import 'package:constitution_of_india/view/notes.dart';
import 'package:constitution_of_india/view/notifications.dart';
import 'package:constitution_of_india/view/parts.dart';
import 'package:constitution_of_india/view/preamble.dart';
import 'package:constitution_of_india/view/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool nightmode = true;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    List<BaseModal> dashboardButton = [
      BaseModal(
          image: "preamble input box",
          name: "Preamble",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Preamble()));
          }),
      BaseModal(
          image: "preamble input box",
          name: "Parts",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Parts()));
          }),
      BaseModal(
          image: "preamble input box",
          name: "Schedule",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Schedule()));
          }),
      BaseModal(
          image: "preamble input box",
          name: "Amendments",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Amendments()));
          }),
      BaseModal(
          image: "preamble input box",
          name: "News Articles",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewsArticles()));
          }),
      BaseModal(
          image: "preamble input box",
          name: "Case Studies",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CaseStudies()));
          })
    ];
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "THE CONSTITUTION OF INDIA",
          style: CustomTextStyles.dashboardTitle,
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/drawer/menu bar background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/image/drawer/menu bar.png"),
                        fit: BoxFit.fill),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "CONSTITUTION \nOF INDIA",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Image.asset("assets/image/drawer/home_icon.png"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Notifications()));
                },
                child: ListTile(
                  title: Text(
                    "Notifications",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Image.asset(
                      "assets/image/drawer/notification bell_icon.png"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Notes(notelist: HiveStore.noteslist)));
                },
                child: ListTile(
                  title: Text(
                    "Notes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Image.asset("assets/image/drawer/notes_icon.png"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Bookmark(bookmarklist: HiveStore.bookmarklist)));
                },
                child: ListTile(
                  title: Text(
                    "Bookmarks",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing:
                      Image.asset("assets/image/drawer/bookmarks icon.png"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  themeProvider.toggleTheme();
                  nightmode = !nightmode;
                },
                child: ListTile(
                  title: nightmode
                      ? Text(
                          "Night Mode",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          "Light Mode",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                  trailing:
                      Image.asset("assets/image/drawer/nightmode_icon.png"),
                ),
              ),
              ListTile(
                title: Text(
                  "Rate Us",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: Image.asset("assets/image/drawer/star.png"),
              ),
              ListTile(
                title: Text(
                  "About",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: Image.asset("assets/image/drawer/about_icon.png"),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/image/background.png",
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const SizedBox(
              height: kToolbarHeight + 50,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height / 4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/parliament image.png"),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: dashboardButton.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      dashboardButton[index].onTap();
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/image/preamble input box.png"),
                            fit: BoxFit.contain),
                      ),
                      child: Center(
                        child: Text(
                          dashboardButton[index].name,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

 // Expanded(
            //   child: Stack(
            //     children: [
            //       Container(
            //         decoration: const BoxDecoration(
            //           image: DecorationImage(
            //             image: AssetImage("assets/image/background.png"),
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //       Positioned.fill(
            //         bottom: MediaQuery.of(context).size.height * 0.54,
            //         child: Container(
            //           decoration: const BoxDecoration(
            //               image: DecorationImage(
            //                   image: AssetImage(
            //                       "assets/image/parliament image.png"))),
            //         ),
            //       ),
            // ,  Positioned.fill(
            //     bottom: 200,
            //     child: GestureDetector(
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const Preamble()));
            //       },
            //       child: Container(
            //         decoration: const BoxDecoration(
            //           image: DecorationImage(
            //             image:
            //                 AssetImage("assets/image/preamble input box.png"),
            //           ),
            //         ),
            //         child: const Center(
            //           child: Text(
            //             "Preamble",
            //             style: TextStyle(fontSize: 30),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            //       Positioned.fill(
            //         bottom: 20,
            //         child: GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const Parts()));
            //           },
            //           child: Container(
            //             decoration: const BoxDecoration(
            //               image: DecorationImage(
            //                 image:
            //                     AssetImage("assets/image/preamble input box.png"),
            //               ),
            //             ),
            //             child: const Center(
            //               child: Text(
            //                 "Parts",
            //                 style: TextStyle(fontSize: 30),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Positioned.fill(
            //         bottom: -160,
            //         child: GestureDetector(
            //           onTap: () {
            //             Navigator.push(context,
            //                 MaterialPageRoute(builder: (context) => const Schedule()));
            //           },
            //           child: Container(
            //             decoration: const BoxDecoration(
            //               image: DecorationImage(
            //                 image:
            //                     AssetImage("assets/image/preamble input box.png"),
            //               ),
            //             ),
            //             child: const Center(
            //               child: Text(
            //                 "Schedule",
            //                 style: TextStyle(fontSize: 30),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Positioned.fill(
            //         bottom: -340,
            //         child: GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const Amendments()));
            //           },
            //           child: Container(
            //             decoration: const BoxDecoration(
            //               image: DecorationImage(
            //                 image:
            //                     AssetImage("assets/image/preamble input box.png"),
            //               ),
            //             ),
            //             child: const Center(
            //               child: Text(
            //                 "Amendments",
            //                 style: TextStyle(fontSize: 30),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Positioned.fill(
            //         bottom: -520,
            //         child: GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const NewsArticles()));
            //           },
            //           child: Container(
            //             decoration: const BoxDecoration(
            //               image: DecorationImage(
            //                 image:
            //                     AssetImage("assets/image/preamble input box.png"),
            //               ),
            //             ),
            //             child: const Center(
            //               child: Text(
            //                 "News Articles",
            //                 style: TextStyle(fontSize: 30),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Positioned.fill(
            //         bottom: -700,
            //         child: GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const CaseStudies()));
            //           },
            //           child: Container(
            //             decoration: const BoxDecoration(
            //               image: DecorationImage(
            //                 image:
            //                     AssetImage("assets/image/preamble input box.png"),
            //               ),
            //             ),
            //             child: const Center(
            //               child: Text(
            //                 "Case Studies",
            //                 style: TextStyle(fontSize: 30),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )

 // Positioned.fill(
                //   bottom: 200,
                //   child: ImageContainer(
                //     context,
                //     ontap: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => Preamble()));
                //     },
                //     imageAsset: "assets/image/preamble input box.png",
                //     text: "Preamble",
                //     textStyle: TextStyle(fontSize: 30),
                //   ),
                // ),
                // Positioned.fill(
                //   bottom: 200,
                //   child: TappableItem(
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => Preamble()));
                //       },
                //       imageAsset: "assets/image/preamble input box.png",
                //       text: "Preamble",
                //       textStyle: TextStyle(fontSize: 30)),
                // ),
                // Positioned.fill(
                //   bottom: 20,
                //   child: GestureDetector(
                //     // onTap: () {
                //     //   Navigator.push(context,
                //     //       MaterialPageRoute(builder: (context) => Preamble()));
                //     // },
                //     child: ImageContainer(context,
                //         imageAsset: "assets/image/preamble input box.png",
                //         text: "Parts",
                //         textStyle: TextStyle(fontSize: 30)),
                //   ),
                // ),
                // Positioned.fill(
                //   bottom: -160,
                //   child: GestureDetector(
                //     // onTap: () {
                //     //   Navigator.push(context,
                //     //       MaterialPageRoute(builder: (context) => Preamble()));
                //     // },
                //     child: ImageContainer(context,
                //         imageAsset: "assets/image/preamble input box.png",
                //         text: "Schedules",
                //         textStyle: TextStyle(fontSize: 30)),
                //   ),
                // ),
                // Positioned.fill(
                //   bottom: -340,
                //   child: GestureDetector(
                //     // onTap: () {
                //     //   Navigator.push(context,
                //     //       MaterialPageRoute(builder: (context) => Preamble()));
                //     // },
                //     child: ImageContainer(context,
                //         imageAsset: "assets/image/preamble input box.png",
                //         text: "Amendments",
                //         textStyle: TextStyle(fontSize: 30)),
                //   ),
                // ),
                // Positioned.fill(
                //   bottom: -520,
                //   child: GestureDetector(
                //     // onTap: () {
                //     //   Navigator.push(context,
                //     //       MaterialPageRoute(builder: (context) => Preamble()));
                //     // },
                //     child: ImageContainer(context,
                //         imageAsset: "assets/image/preamble input box.png",
                //         text: "News Articles",
                //         textStyle: TextStyle(fontSize: 30)),
                //   ),
                // ),
                // Positioned.fill(
                //   bottom: -700,
                //   child: ImageContainer(context,
                //       imageAsset: "assets/image/preamble input box.png",
                //       text: "Case Studies",
                //       textStyle: TextStyle(fontSize: 30)),
                // ),

// String getDensityFolder(double screenDensity) {
//   if (screenDensity < 1.5) {
//     return "hdpi";
//   } else if (screenDensity < 2.0) {
//     return "mhdpi";
//   } else if (screenDensity < 3.0) {
//     return "xhdpi";
//   } else if (screenDensity < 4.0) {
//     return "xxhdpi";
//   } else {
//     return "xxxhdpi";
//   }
// }


 // double screenDensity = 0;
  // String densityFolder = "";

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   screenDensity = MediaQuery.of(context).devicePixelRatio;
  //   densityFolder = getDensityFolder(screenDensity);
  // }