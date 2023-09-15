import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider/planet.dart';
import '../controller/provider/themeprovider.dart';
import '../modals/planetmodel.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> with SingleTickerProviderStateMixin{

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

    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
        actions: [
          Icon(Icons.favorite,color: Colors.red,),
        ],
      ),
      body: (Provider.of<Favourite_Provider>(context).favourite.isEmpty)
          ? Container(
              height: _height * 1,
              color: Provider.of<ThemeProvider>(context, listen: true)
                      .changethemeModel
                      .isDark
                  ? Colors.white
                  : Color(0xff191932),
              child: Center(
                child: Text('No favorite planets yet.'),
              ))
          : Container(
              height: _height * 1,
              color: Provider.of<ThemeProvider>(context, listen: true)
                      .changethemeModel
                      .isDark
                  ? Colors.white
                  : Color(0xff191932),
              child: ListView.builder(
                itemCount:
                    Provider.of<Favourite_Provider>(context).favourite.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: RotationTransition(
                        turns: animationController,
                        child: Image.asset(
                            "${Provider.of<Favourite_Provider>(context).favourite[index].image}",
                            height: 100),
                      ),
                      title: Text(
                          "${Provider.of<Favourite_Provider>(context).favourite[index].name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          "${Provider.of<Favourite_Provider>(context).favourite[index].name1}  "),
                      trailing: IconButton(
                        onPressed: (){
                        },
                        icon: Icon(CupertinoIcons.delete_solid,color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
