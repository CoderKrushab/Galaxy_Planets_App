import 'package:flutter/material.dart';

import '../galaxyData/dataGalaxy.dart';

class galaxypage extends StatefulWidget {
  const galaxypage({Key? key}) : super(key: key);

  @override
  State<galaxypage> createState() => _galaxypageState();
}

class _galaxypageState extends State<galaxypage> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 5),
        upperBound: 1,
        lowerBound: 0);
    controller.repeat();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, size: 28,),
        actions: const [
          Icon(Icons.search, size: 28,),
          SizedBox(width: 10)
        ],
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        title: const Text("Galaxy Planet", style: TextStyle(fontSize: 28),),
        backgroundColor: const Color(0xFF3E3963),
        centerTitle: true,
      ),
        backgroundColor: const Color(0xFF3E3963),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 15),
          physics: const BouncingScrollPhysics(),
          children: galaxyPlanet
              .map((k) => Padding(
                    padding: EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "planet_page",
                            arguments: k);
                      },
                      child: Stack(
                        alignment: const Alignment(0.60,0),
                        children: [
                          Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width * 0.75,
                            padding: const EdgeInsets.only(
                                left: 80, top: 10, bottom: 20),
                            decoration: BoxDecoration(
                                color: const Color(0xFF3E3963),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    offset: const Offset(0, 0),
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(k.planetName,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500)),
                                    FloatingActionButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      foregroundColor: const Color(0xffC2BDEA),
                                      backgroundColor: const Color(0xFF3E3963),
                                      mini: true,
                                      child: const Icon(Icons.more_vert_rounded),
                                    ),
                                  ],
                                ),
                                Text(k.galaxyName,
                                    style: const TextStyle(
                                        color: Color(0xffC2BDEA),
                                        fontSize: 15)),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(
                                  endIndent: 180,
                                  color: Color(0xffC2BDEA),
                                  thickness: 5,
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Image.asset('galaxy/ic_distance.png',
                                        width: 10),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      k.distanceFromSun,
                                      style: const TextStyle(
                                          color: Color(0xffC2BDEA)),
                                    ),
                                    const Spacer(),
                                    Image.asset('galaxy/ic_gravity.png',
                                        width: 10),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      k.gravity,
                                      style: const TextStyle(
                                          color: Color(0xffC2BDEA)),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          AnimatedBuilder(
                            animation: controller,
                            builder: (BuildContext context, Widget? child) {
                              return Transform.translate(
                                offset: const Offset(-205, 0),
                                child: Transform.rotate(
                                  angle: controller.value * 2 * 3.14159265359,
                                  child: child,
                                ),
                              );
                            },
                            child: Image.asset(k.image, width: 100,),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ));
  }
}
