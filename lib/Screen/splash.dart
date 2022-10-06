import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'galaxypage.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                galaxypage()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E3963),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 165,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 500,
                  width: 500,
                  child: Lottie.asset("lotti/Galaxy.json"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 475),
                  child: Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                        width: 300,
                        height: 15,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3E3963)),
                            backgroundColor: Color(0xffD6D6D6),
                          ),
                        ),
                      )
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
