import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modals/planetmodel.dart';

class PlanetProvider extends ChangeNotifier{
  String? data;
  List<PlanetModel> Planet = [];

  Future<void> FormJson() async {
    data = await rootBundle.loadString("assets/json/planet.json");
    List decodeList = jsonDecode(data!) ;
    Planet =
        decodeList.map((e) => PlanetModel.fromMap(data: e)).toList();
    notifyListeners();

  }



  falseToTrue({required int i}) async {
    Planet[i].favourite = true;
  }

  trueToFalse({required int i}) async {
    Planet[i].favourite = false;
  }

}

// }

class Favourite_Provider with ChangeNotifier {
  List<PlanetModel> favourite = [];

  addToFavourite({required PlanetModel added}) async {
    favourite.add(added);
    notifyListeners();
  }

  removeToFavourite({required PlanetModel added}) async {
    favourite.remove(added);
    notifyListeners();
  }
}
