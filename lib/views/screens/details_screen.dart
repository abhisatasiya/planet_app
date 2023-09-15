import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/planet.dart';

class Details_screen extends StatefulWidget {
  const Details_screen({Key? key}) : super(key: key);

  @override
  State<Details_screen> createState() => _Details_screenState();
}

class _Details_screenState extends State<Details_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: _width * 1,
        height: _height * 1,
        child: Padding(
          padding: EdgeInsets.all(_height * 0.015),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _height * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: _height * 0.3,
                      width: _width * 0.8,
                      child: AnimatedBuilder(
                        animation: animationController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: animationController.value * 2 * pi,
                            child: Image.asset(
                              Provider.of<PlanetProvider>(context)
                                  .Planet[data]
                                  .image,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _height * 0.04,
                ),
                Row(
                  children: [
                    Text(
                      Provider.of<PlanetProvider>(context).Planet[data].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(width: 140),
                    IconButton(
                        onPressed: () {
                          animationController.reverse();
                        },
                        icon: Icon(Icons.rotate_90_degrees_ccw_outlined)),
                    IconButton(
                        onPressed: () {
                          animationController.repeat();
                        },
                        icon: Icon(Icons.rotate_90_degrees_cw_outlined))
                  ],
                ),
                SizedBox(
                  height: _height * 0.01,
                ),
                Text(
                  Provider.of<PlanetProvider>(context).Planet[data].name1,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: _height * 0.01,
                ),
                Divider(),
                SizedBox(
                  height: _height * 0.01,
                ),
                Text("Infromation",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                SizedBox(
                  height: _height * 0.01,
                ),
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Provider.of<PlanetProvider>(context)
                          .Planet[data]
                          .Exploration
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _height * 0.02,
                ),
                Text("Gallery",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                SizedBox(
                  height: _height * 0.02,
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: _height * 0.02,
                        ),
                        Column(
                          children: [
                            Container(
                              height: _height * 0.12,
                              width: _width * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(
                                  width: _width * 0.004,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                    Provider.of<PlanetProvider>(context)
                                        .Planet[data]
                                        .gallery1,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _height * 0.02,
                            ),
                            Container(
                              height: _height * 0.12,
                              width: _width * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(
                                  width: _width * 0.004,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    Provider.of<PlanetProvider>(context)
                                        .Planet[data]
                                        .gallery2,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _height * 0.02,
                            ),
                            Container(
                              height: _height * 0.12,
                              width: _width * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(
                                  width: _width * 0.004,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    Provider.of<PlanetProvider>(context)
                                        .Planet[data]
                                        .gallery3,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: _height * 0.02,
                        ),
                        Column(
                          children: [
                            Container(
                              height: _height * 0.2,
                              width: _width * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(
                                  width: _width * 0.004,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    Provider.of<PlanetProvider>(context)
                                        .Planet[data]
                                        .gallery4,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _height * 0.02,
                            ),
                            Container(
                              height: _height * 0.2,
                              width: _width * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(
                                  width: _width * 0.004,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    Provider.of<PlanetProvider>(context)
                                        .Planet[data]
                                        .gallery5,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
