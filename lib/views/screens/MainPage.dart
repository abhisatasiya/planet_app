import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../components/fvtpage.dart';
import '../../components/homepage.dart';
import '../../components/setting_page.dart';
import '../../controller/provider/planet.dart';
import '../../controller/provider/themeprovider.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
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

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    FavoritePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
       child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Transform.scale(
        scale: 0.85,
        child: Container(
          height: 65,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
            child: BottomNavigationBar(
              backgroundColor:  Provider.of<ThemeProvider>(context,
                  listen: true).changethemeModel.isDark
                  ?Colors.grey
                  :Color(0xff373966),
              selectedItemColor: Colors.red,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Hello",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart),
                  label: "Favourite",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: "settings",
                ),
              ],
              // Bottom Navigation Bar items and configurations...
            ),
          ),
        ),
      ),  backgroundColor:  Provider.of<ThemeProvider>(context,
        listen: true).changethemeModel.isDark
        ?Colors.white
        :Color(0xff191932)
    );
  }
}
