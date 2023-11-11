import 'package:constitution_of_india/helper/util.dart';
import 'package:constitution_of_india/provider/newsarticle_provider.dart';
import 'package:constitution_of_india/view/newsarticles_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsArticles extends StatefulWidget {
  const NewsArticles({super.key});

  @override
  State<NewsArticles> createState() => _NewsArticlesState();
}

class _NewsArticlesState extends State<NewsArticles> {
  String extractModifiedTitle(String originalTitle) {
    // Split the original title by dates, assuming dates end with digits
    final parts = originalTitle.split(RegExp(r'\d{4}'));

    // Take the first part as the title
    final title = parts.isNotEmpty ? parts.first.trim() : originalTitle;

    return title;
  }

  @override
  void initState() {
    context.read<NewsArticleProvider>().getnewsarticles();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<NewsArticleProvider>().response!.isEmpty
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
                      child: Image.asset("assets/image/newsarticle/back.png"),
                    ),
                  ),
                  Container(
                    height: kToolbarHeight + 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/image/newsarticle/newspaperimage.png"),
                          fit: BoxFit.cover),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "NEWS ARTICLES",
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
                          context.watch<NewsArticleProvider>().response!.length,
                      itemBuilder: (context, index) {
                        String originalTitle = context
                            .watch<NewsArticleProvider>()
                            .response![index]
                            .title;
                        String modifiedTitle =
                            extractModifiedTitle(originalTitle);
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
                                  builder: (context) => NewsArticlesPage(
                                    description: context
                                        .watch<NewsArticleProvider>()
                                        .response![index]
                                        .smallDescription,
                                    title: context
                                        .watch<NewsArticleProvider>()
                                        .response![index]
                                        .title,
                                    date: context
                                        .watch<NewsArticleProvider>()
                                        .response![index]
                                        .date,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/image/newsarticle/newsarticle1_inputbox.png"),
                                ),
                              ),
                              child: Center(
                                child: ListTile(
                                  // leading: Image.asset(
                                  //     "assets/image/newsarticle/chakra.png"),
                                  title: Row(
                                    children: [
                                      Image.asset(
                                          "assets/image/newsarticle/chakra.png"),
                                      hSize(5),
                                      Expanded(
                                        child: Text(
                                          modifiedTitle,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      hSize(260),
                                      Text(
                                        "${context.watch<NewsArticleProvider>().response![index].date}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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

// String extractModifiedTitle(String originalTitle) {
  //   final regExp =
  //       RegExp(r"(Monday, [A-Za-z]{3} \d{1,2}, \d{4}|Google)|[^a-zA-Z]");
  //   return originalTitle.replaceAll(regExp, '').trim();
  // }

  // String extractModifiedTitle(String originalTitle) {
  //   final regExp =
  //       RegExp(r"(\w+\s+,\s+[A-Za-z]{3}\s+\d{1,2},\s+\d{4})|[^a-zA-Z]");
  //   final matches = regExp.allMatches(originalTitle);
  //   final modifiedTitle = matches
  //       .map((match) => originalTitle.substring(match.start, match.end))
  //       .join('');
  //   return modifiedTitle;
  // }
  
//     Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text("THE CONSTITUTION OF INDIA"),
//         leading: GestureDetector(
//           child: Image.asset("assets/image/amendments/back.png"),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//                 height: 30,
//                 width: 30,
//                 child: Image.asset("assets/image/amendments/seach.png")),
//           )
//         ],
//       ),
//       body: context.watch<NewsArticleProvider>().response!.isEmpty
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
//                             "assets/image/newsarticle/newspaperimage.png"),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "NEWS ARTICLES",
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
//                         context.watch<NewsArticleProvider>().response!.length,
//                     itemBuilder: (context, index) {
//                       String originalTitle = context
//                           .watch<NewsArticleProvider>()
//                           .response![index]
//                           .title;
//                       String modifiedTitle =
//                           extractModifiedTitle(originalTitle);
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
//                                 builder: (context) => NewsArticlesPage(
//                                   description: context
//                                       .watch<NewsArticleProvider>()
//                                       .response![index]
//                                       .smallDescription,
//                                   title: modifiedTitle,
//                                   date: context
//                                       .watch<NewsArticleProvider>()
//                                       .response![index]
//                                       .date,
//                                 ),
//                               ),
//                             );
//                           },
                          // child: Container(
                          //   height: MediaQuery.sizeOf(context).height * 0.1,
                          //   width: MediaQuery.sizeOf(context).width * 0.8,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //       image: AssetImage(
                          //           "assets/image/newsarticle/newsarticle1_inputbox.png"),
                          //     ),
                          //   ),
                          //   child: Center(
                          //     child: ListTile(
                          //       // leading: Image.asset(
                          //       //     "assets/image/newsarticle/chakra.png"),
                          //       title: Row(
                          //         children: [
                          //           Image.asset(
                          //               "assets/image/newsarticle/chakra.png"),
                          //           hSize(5),
                          //           Expanded(
                          //             child: Text(
                          //               modifiedTitle,
                          //               overflow: TextOverflow.ellipsis,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       subtitle: Row(
                          //         children: [
                          //           hSize(260),
                          //           Text(
                          //             "${context.watch<NewsArticleProvider>().response![index].date}",
                          //             style: TextStyle(fontSize: 12),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                      //  ),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             ),
//     );
//   }
// }
