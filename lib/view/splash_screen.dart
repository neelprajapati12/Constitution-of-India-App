import 'dart:async';

import 'package:constitution_of_india/helper/util.dart';
import 'package:constitution_of_india/view/dashboard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const DashBoard()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/splashscreen/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.3,
                width: MediaQuery.sizeOf(context).width * 0.65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/image/splashscreen/border circle.png"),
                      fit: BoxFit.fill),
                ),
                child: Image.asset(
                    "assets/image/splashscreen/parliament image.png"),
              ),
            ),
            vSize(20),
            Row(
              children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.2,
                    child:
                        Image.asset("assets/image/splashscreen/LEFT LINE.png")),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: Image.asset(
                      "assets/image/splashscreen/CONSTITUTION OF INDIA.png"),
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.2,
                    child:
                        Image.asset("assets/image/splashscreen/Fill 29.png")),
              ],
            ),
            vSize(5),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: Image.asset("assets/image/splashscreen/coi underline.png"),
            ),
          ],
        ),
      ),
    );
  }
}
