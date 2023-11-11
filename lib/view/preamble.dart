import 'package:constitution_of_india/helper/util.dart';
import 'package:constitution_of_india/provider/preamble_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Preamble extends StatefulWidget {
  const Preamble({super.key});

  @override
  State<Preamble> createState() => _PreambleState();
}

class _PreambleState extends State<Preamble> {
  @override
  void initState() {
    context.read<PreambleProvider>().getpreamble();
    // TODO: implement initState
    super.initState();
  }

  double fontSize = 18;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
              70), // Adjust the height to match your custom app bar
          child: CustomAppBars(
            onFontSizeIncrease: () {
              if (fontSize == 18) {
                fontSize = 24;
              } else {
                fontSize = 18;
              }
              setState(() {});
            },
            title: "PREAMBLE",
            backButtonImage: "assets/image/preamble/back.png",
            shareButtonImage: "assets/image/preamble/TEXT A.png",
            otherActionButtonImage: "assets/image/preamble/share.png",
          ),
        ),
        body: context.watch<PreambleProvider>().response!.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.25,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/image/preamble/flag image.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        vSize(20),
                        Positioned.fill(
                          top: -330,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).height * 0.02,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.02,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/image/preamble/play button_icon.png"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              hSize(20),
                              Container(
                                width: MediaQuery.sizeOf(context).height * 0.02,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.02,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/image/preamble/pause button icon.png"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              hSize(20),
                              Container(
                                width: MediaQuery.sizeOf(context).height * 0.02,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.02,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/image/preamble/stop-button_icon.png"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ],
                          ),
                        ),
                        vSize(20),
                        Positioned.fill(
                          top: -270,
                          child: Image.asset(
                              "assets/image/preamble/SEPARATOR LINE.png"),
                        ),
                        Positioned.fill(
                          left: 330,
                          bottom: 270,
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                                "assets/image/preamble/bookmark.png"),
                          ),
                        ),
                        Positioned.fill(
                          top: 290,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Preamble",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  vSize(10),
                                  const Text(
                                    "Constitution of India",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  vSize(10),
                                  Image.asset(
                                      "assets/image/preamble/SEPARATOR LINE.png"),
                                  vSize(15),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: Text(
                                        "${context.watch<PreambleProvider>().response![0]['description']}",
                                        style: TextStyle(fontSize: fontSize),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
