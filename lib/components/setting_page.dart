import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider/themeprovider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
          },
          icon: Icon(Icons.arrow_back,size: 25),
        ),
        centerTitle: true,
        title: Text("Settings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
        actions: [
          Icon(Icons.search,),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Provider.of<ThemeProvider>(context,
            listen: true).changethemeModel.isDark
            ?Colors.white
            :Color(0xff191932),
      ),
      body: Container(
        color: Provider.of<ThemeProvider>(context,
            listen: true).changethemeModel.isDark
            ?Colors.white
            :Color(0xff191932),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(("Language"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ),
                  IconButton(onPressed: () {
                  }, icon: Icon(Icons.arrow_forward))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(("Light Mode"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ),
                  Switch(
                    value: Provider.of<ThemeProvider>(context,
                        listen: true).changethemeModel.isDark,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context,
                          listen: false)
                          .chnageTheme();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(("Notification"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                  IconButton(onPressed: () {
                  }, icon: Icon(Icons.arrow_forward))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(("Account"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                  IconButton(onPressed: () {
                  }, icon: Icon(Icons.arrow_forward))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(("Help"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                  IconButton(onPressed: () {
                  }, icon: Icon(Icons.arrow_forward))
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
