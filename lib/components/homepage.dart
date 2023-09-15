import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider/planet.dart';
import '../controller/provider/themeprovider.dart';
import '../modals/planetmodel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? data;
  int i = 0;
  double rotationAngle = 0.0;
  Timer? rotationTimer;

  List<Color> containerColors = [
    Colors.brown,
    Colors.blue,
    Colors.grey,
    Colors.red,
    Colors.orange,
    Colors.orange.shade50,
    Colors.blueAccent,
    Colors.deepPurple
  ];

  @override
  void initState() {
    super.initState();
    startRotation();
    loadJSON();
  }

  loadJSON() async {
    await Provider.of<PlanetProvider>(context, listen: false).FormJson();
  }

  void startRotation() {
    rotationTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {
        rotationAngle += 0.1;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    rotationTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: _height * 1,
            color: Provider.of<ThemeProvider>(context, listen: true)
                    .changethemeModel
                    .isDark
                ? Colors.white
                : Color(0xff191932),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Let's Explore",
                              style: TextStyle(fontSize: 28),
                            ),
                            IconButton(
                              onPressed: () {
                                Provider.of<ThemeProvider>(context,
                                        listen: false)
                                    .chnageTheme();
                              },
                              icon: Provider.of<ThemeProvider>(context)
                                      .changethemeModel
                                      .isDark
                                  ? const Icon(Icons.light_mode_outlined)
                                  : const Icon(Icons.dark_mode_rounded),
                            ),
                          ],
                        ),
                        Text(
                          "The milky way galaxy",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.6),
                            hintText: "Search for your Favorite planets",
                            hintStyle: const TextStyle(color: Colors.grey),
                            labelStyle: const TextStyle(),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: _height * 0.035,
                        ),
                        Row(
                          children: [
                            Text(
                              "Most popular",
                              style: TextStyle(
                                  fontSize: _height * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: _height * 0.02,
                            ),
                            const Icon(Icons.arrow_right_alt),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          Provider.of<PlanetProvider>(context).Planet.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 15,
                        mainAxisExtent: 180,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("details", arguments: index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: containerColors[
                                  index % containerColors.length],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: _height * 0.01,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: TweenAnimationBuilder(
                                    duration: const Duration(seconds: 2),
                                    tween: Tween<double>(begin: 0, end: 2 * pi),
                                    child: Center(
                                      child: Image.asset(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[index]
                                            .image,
                                      ),
                                    ),
                                    builder: (BuildContext context,
                                        double value, Widget? widget) {
                                      return Transform.rotate(
                                        angle: rotationAngle,
                                        child: widget,
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Provider.of<PlanetProvider>(context)
                                              .Planet[index]
                                              .name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: _height * 0.01,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Provider.of<PlanetProvider>(context)
                                              .Planet[index]
                                              .name1,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: _height * 0.03,
                  ),
                  Row(
                    children: [
                      const Text(
                        "You may also like",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: _height * 0.02,
                      ),
                      const Icon(Icons.arrow_right_alt),
                    ],
                  ),
                  SizedBox(
                    height: _height * 0.02,
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 50,
                      ),
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            Provider.of<PlanetProvider>(context).Planet.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 15,
                                mainAxisExtent: 150,
                                crossAxisSpacing: 30),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed("details", arguments: index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: containerColors[
                                    index % containerColors.length],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: _height * 0.01,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: TweenAnimationBuilder(
                                      duration: const Duration(seconds: 2),
                                      tween:
                                          Tween<double>(begin: 0, end: 2 * pi),
                                      child: Center(
                                        child: Image.asset(
                                          Provider.of<PlanetProvider>(context)
                                              .Planet[index]
                                              .image,
                                          scale: 2,
                                        ),
                                      ),
                                      builder: (BuildContext context,
                                          double value, Widget? widget) {
                                        return Transform.rotate(
                                          angle: rotationAngle,
                                          child: widget,
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            Provider.of<PlanetProvider>(context)
                                                .Planet[index]
                                                .name,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              PlanetModel planet =
                                                  Provider.of<PlanetProvider>(
                                                          context,
                                                          listen: false)
                                                      .Planet[index];
                                              if (Provider.of<
                                                          Favourite_Provider>(
                                                      context,
                                                      listen: false)
                                                  .favourite
                                                  .contains(planet)) {
                                                (Provider.of<
                                                            Favourite_Provider>(
                                                        context,
                                                        listen: false)
                                                    .removeToFavourite(
                                                        added: planet));
                                              } else {
                                                (Provider.of<
                                                            Favourite_Provider>(
                                                        context,
                                                        listen: false)
                                                    .addToFavourite(
                                                        added: planet));
                                              }
                                            },
                                            icon: Consumer<PlanetProvider>(
                                              builder:
                                                  (context, planetProvider, _) {
                                                bool isFavorite =
                                                    planetProvider.Planet
                                                        .contains(planetProvider
                                                            .Planet[index]);
                                                return (isFavorite == false)
                                                    ? Icon(Icons.favorite,
                                                        color: Colors.red)
                                                    : Icon(
                                                        Icons.favorite_border,
                                                        color: Colors.white);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
