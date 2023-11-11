import 'package:constitution_of_india/helper/util.dart';
import 'package:constitution_of_india/provider/casestudies_provider.dart';
import 'package:constitution_of_india/view/casestudies_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaseStudies extends StatefulWidget {
  const CaseStudies({super.key});

  @override
  State<CaseStudies> createState() => _CaseStudiesState();
}

class _CaseStudiesState extends State<CaseStudies> {
  @override
  void initState() {
    context.read<CaseStudiesProvider>().getcasestudies();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<CaseStudiesProvider>().response!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
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
                    height: kToolbarHeight + 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/image/schedule/schedule image.png"),
                          fit: BoxFit.cover),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "SCHEDULES",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "SOME IMPORTANT CASES",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      //  physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          context.watch<CaseStudiesProvider>().response!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CaseStudiesPage(
                                    description: context
                                        .watch<CaseStudiesProvider>()
                                        .response![index]
                                        .smallDescription,
                                    title: context
                                        .watch<CaseStudiesProvider>()
                                        .response![index]
                                        .title,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.09,
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/image/casestudies/case1_inputbox.png"),
                                    fit: BoxFit.fill),
                              ),
                              child: Row(
                                children: [
                                  hSize(5),
                                  Image.asset(
                                      "assets/image/casestudies/chakra.png"),
                                  hSize(10),
                                  Center(
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      child: Text(
                                        "${context.watch<CaseStudiesProvider>().response![index].title}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

//     Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text("THE CONSTITUTION OF INDIA"),
//         leading: GestureDetector(
//           child: Image.asset("assets/image/amendments/back.png"),
//         ),
//       ),
//       body: context.watch<CaseStudiesProvider>().response!.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : Stack(
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("assets/image/background.png"),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Positioned.fill(
//                   bottom: 530,
//                   child: Container(
//                     height: MediaQuery.sizeOf(context).height * 0.3,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage(
//                             "assets/image/casestudies/case studies.png"),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "CASE STUDIES",
//                           style: TextStyle(color: Colors.white, fontSize: 30),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned.fill(
//                   top: 250,
//                   left: 10,
//                   child: Text(
//                     "SOME IMPORTANT CASES",
//                     style: TextStyle(fontSize: 25, color: Colors.white),
//                   ),
//                 ),
//                 Positioned.fill(
//                   top: 170,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     //  physics: NeverScrollableScrollPhysics(),
//                     itemCount:
//                         context.watch<CaseStudiesProvider>().response!.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => CaseStudiesPage(
//                                   description: context
//                                       .watch<CaseStudiesProvider>()
//                                       .response![index]
//                                       .smallDescription,
//                                   title: context
//                                       .watch<CaseStudiesProvider>()
//                                       .response![index]
//                                       .title,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             height: MediaQuery.sizeOf(context).height * 0.09,
//                             width: MediaQuery.sizeOf(context).width * 0.8,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage(
//                                       "assets/image/casestudies/case1_inputbox.png"),
//                                   fit: BoxFit.fill),
//                             ),
//                             child: Row(
//                               children: [
//                                 Image.asset(
//                                     "assets/image/casestudies/chakra.png"),
//                                 Center(
//                                   child: SizedBox(
//                                     width:
//                                         MediaQuery.sizeOf(context).width * 0.8,
//                                     child: Text(
//                                       "${context.watch<CaseStudiesProvider>().response![index].title}",
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             ),
//     );
//   }
// }
