import 'dart:convert';

import 'package:constitution_of_india/modal/parts_extended_modal.dart';
import 'package:constitution_of_india/view/parts_articles_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:constitution_of_india/provider/parts_provider.dart';
import 'package:http/http.dart' as http;

class Parts extends StatefulWidget {
  const Parts({Key? key}) : super(key: key);

  @override
  State<Parts> createState() => _PartsState();
}

class _PartsState extends State<Parts> {
  String? tappedPartId;
  List<PartsExtendedModal>? titles = [];
  fetchTitles(String partId) async {
    try {
      var title = await http.get(Uri.parse(
          "http://mapi.trycatchtech.com/v3/constitution_of_india/constitution_of_india_articles?part_id=$partId"));
      if (title.statusCode == 200) {
        final titleData = jsonDecode(title.body);

        if (titleData is List) {
          // Check if the response is a List (["No data Found"])
          if (titleData.isNotEmpty && titleData.first is Map<String, dynamic>) {
            // Handle the valid JSON response
            titles = PartsExtendedModal.partsextendedmodal(titleData)
                .cast<PartsExtendedModal>();
          } else {
            // Handle the case when "No data Found" is returned
            titles = [];
          }
        } else {
          // Handle other response types if needed
          titles = [];
        }
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  void handlePartTap(String partId) {
    setState(() {
      tappedPartId = partId;
    });
    fetchTitles(tappedPartId!);
  }

  @override
  void initState() {
    super.initState();
    tappedPartId = "1";
    fetchTitles(tappedPartId!);
    context.read<PartsProvider>().getparts();
  }

  @override
  Widget build(BuildContext context) {
    final partsProvider = context.read<PartsProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: context.watch<PartsProvider>().response!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/background.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
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
                              child: Image.asset(
                                  "assets/image/schedule/seach.png"),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: kToolbarHeight + 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/image/parts/parts_categories Backgroung.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: partsProvider.response!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                handlePartTap(
                                    partsProvider.response![index].id!);
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/image/parts/PART SELECTED.png"),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "${partsProvider.response![index].title}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      titles == null
                          ? Center(child: CircularProgressIndicator())
                          : titles!.isEmpty
                              ? Column(
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        "assets/image/no data.png",
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "NO DATA",
                                      style: TextStyle(fontSize: 30),
                                    )
                                  ],
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: titles!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PartsArticlesPage(
                                                        description:
                                                            titles![index]
                                                                .description,
                                                        smalldescription:
                                                            titles![index]
                                                                .smallDescription,
                                                        title: titles![index]
                                                            .title,
                                                      )));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/image/parts/article1_input box.png",
                                                ),
                                                fit: BoxFit.fill),
                                          ),
                                          child: ListTile(
                                            leading: Image.asset(
                                                "assets/image/parts/chakra.png"),
                                            title: Text(
                                              "${titles![index].title}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                            subtitle: Text(
                                              "${titles![index].smallDescription}",
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}


// fetchTitles(String partId) async {
  //   try {
  //     var title = await http.get(Uri.parse(
  //         "http://mapi.trycatchtech.com/v3/constitution_of_india/constitution_of_india_articles?part_id=$partId"));
  //     if (title.statusCode == 200) {
  //       final titleData = jsonDecode(title.body);
  //       titles = PartsExtendedModal.partsextendedmodal(titleData)
  //           .cast<PartsExtendedModal>();
  //       print(titleData);
  //       setState(() {});
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

// import 'package:constitution_of_india/modal/parts_modal.dart';
// import 'package:constitution_of_india/provider/parts_provider.dart';
// import 'package:constitution_of_india/view/parts_extended.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Parts extends StatefulWidget {
//   const Parts({super.key});

//   @override
//   State<Parts> createState() => _PartsState();
// }

// class _PartsState extends State<Parts> {
//   // List<bool> expands = [];
//   // bool dataLoaded = false;
//   // void selectparts() async {
//   //   await context.read<PartsProvider>().getparts();
//   //   expands = List.generate(
//   //     context.watch<PartsProvider>().response!.length,
//   //     (index) => index == 0, // Set the first index to true, others to false
//   //   );
//   //   dataLoaded = true;
//   // }

//   @override
//   void initState() {
//     context.read<PartsProvider>().getparts();
//     super.initState();
//     //selectparts();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: context.watch<PartsProvider>().response!.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : Container(
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("assets/image/background.png"),
//                       fit: BoxFit.cover)),
//               child: Column(
//                 children: [
//                   AppBar(
//                     backgroundColor: Colors.transparent,
//                     elevation: 0,
//                     title: const Text("THE CONSTITUTION OF INDIA"),
//                     leading: GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Image.asset("assets/image/schedule/back.png"),
//                     ),
//                     actions: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SizedBox(
//                             height: 30,
//                             width: 30,
//                             child:
//                                 Image.asset("assets/image/schedule/seach.png")),
//                       )
//                     ],
//                   ),
//                   Container(
//                     height: kToolbarHeight + 50,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage(
//                               "assets/image/parts/parts_categories Backgroung.png"),
//                           fit: BoxFit.fill),
//                     ),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount:
//                           context.watch<PartsProvider>().response!.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {});
//                             PartsExtended(
//                                 id: context
//                                     .watch<PartsProvider>()
//                                     .response![index]
//                                     .id,
//                                 description: context
//                                     .watch<PartsProvider>()
//                                     .response![index]
//                                     .smallDescription);
//                           },
//                           child: Container(
//                             height: MediaQuery.sizeOf(context).height * 0.25,
//                             width: MediaQuery.sizeOf(context).width * 0.25,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                     "assets/image/parts/PART SELECTED.png"),
//                               ),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "${context.watch<PartsProvider>().response![index].title}",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   // Text("${context.watch<PartsProvider>().response![index]}"),
//                 ],
//               ),
//             ),
//     );
//   }
// }

 //expands[index] = !expands[index];
//expands[index]
                            //     ? BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         image: DecorationImage(
                            //           image: AssetImage(
                            //               "assets/image/parts/part.png"),
                            //         ),
                            //       )
                            //     :

//      Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text("THE CONSTITUTION OF INDIA"),
//         leading: GestureDetector(
//           child: Image.asset("assets/image/parts/back.png"),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//                 height: 30,
//                 width: 30,
//                 child: Image.asset("assets/image/parts/search.png")),
//           )
//         ],
//       ),
//       body: context.watch<PartsProvider>().response!.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : Column(
//               children: [
//                 Expanded(
//                   child: Stack(
//                     children: [
//                       Container(
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage("assets/image/background.png"),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                       Positioned.fill(
//                         bottom: 540,
//                         child: Container(
//                           height: MediaQuery.sizeOf(context).height * 0.3,
//                           width: double.infinity,
//                           decoration: const BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage(
//                                   "assets/image/parts/parts_categories Backgroung.png"),
//                             ),
//                           ),
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount:
//                                 context.watch<PartsProvider>().response!.length,
//                             itemBuilder: (context, index) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   setState(() {});
//                                   PartsExtended(
//                                       id: context
//                                           .watch<PartsProvider>()
//                                           .response![index]
//                                           .id);
//                                 },
//                                 child: Container(
//                                   height:
//                                       MediaQuery.sizeOf(context).height * 0.25,
//                                   width:
//                                       MediaQuery.sizeOf(context).width * 0.25,
//                                   decoration: const BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           "assets/image/parts/part.png"),
//                                     ),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "${context.watch<PartsProvider>().response![index].title}",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//     );
//   }
// }
