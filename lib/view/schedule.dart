import 'package:constitution_of_india/helper/util.dart';
import 'package:constitution_of_india/provider/schedule_provider.dart';
import 'package:constitution_of_india/view/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  void initState() {
    print("Schedule");
    context.read<ScheduleProvider>().getschedules();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<ScheduleProvider>().response!.isEmpty
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
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 30,
                            width: 30,
                            child:
                                Image.asset("assets/image/schedule/seach.png")),
                      )
                    ],
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
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      //  physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          context.watch<ScheduleProvider>().response!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SchedulePage(
                                    description: context
                                        .watch<ScheduleProvider>()
                                        .response![index]
                                        .smallDescription,
                                    title: context
                                        .watch<ScheduleProvider>()
                                        .response![index]
                                        .title,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/image/schedule/schedule1_inputbox.png"),
                                ),
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
                                        "${context.watch<ScheduleProvider>().response![index].title}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
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


// import 'package:constitution_of_india/provider/schedule_provider.dart';
// import 'package:constitution_of_india/view/schedule_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Schedule extends StatefulWidget {
//   const Schedule({super.key});

//   @override
//   State<Schedule> createState() => _ScheduleState();
// }

// class _ScheduleState extends State<Schedule> {
//   @override
//   void initState() {
//     context.read<ScheduleProvider>().getschedules();
//     // TODO: implement initState
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text("THE CONSTITUTION OF INDIA"),
//         leading: GestureDetector(
//           child: Image.asset("assets/image/schedule/back.png"),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//                 height: 30,
//                 width: 30,
//                 child: Image.asset("assets/image/schedule/seach.png")),
//           )
//         ],
//       ),
//       body: context.watch<ScheduleProvider>().response!.isEmpty
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
//                             "assets/image/schedule/schedule image.png"),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "SCHEDULES",
//                           style: TextStyle(color: Colors.white, fontSize: 30),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned.fill(
//                   top: 120,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     //  physics: NeverScrollableScrollPhysics(),
//                     itemCount:
//                         context.watch<ScheduleProvider>().response!.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(
//                           left: 20.0,
//                           right: 20.0,
//                         ),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => SchedulePage(
//                                   description: context
//                                       .watch<ScheduleProvider>()
//                                       .response![index]
//                                       .smallDescription,
//                                   title: context
//                                       .watch<ScheduleProvider>()
//                                       .response![index]
//                                       .title,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             height: MediaQuery.sizeOf(context).height * 0.1,
//                             width: MediaQuery.sizeOf(context).width * 0.8,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                     "assets/image/schedule/schedule1_inputbox.png"),
//                               ),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "${context.watch<ScheduleProvider>().response![index].title}",
//                                 style: TextStyle(fontSize: 25),
//                               ),
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
