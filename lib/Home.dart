import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasawallpaperapp/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'apiModel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<WallpaperModel> wallpapers = new List();

  getTrendingWallpapers() async{
    String url = 'https://api.pexels.com/v1/curated?per_page=15';
    try {
      var response = await http.get(url, headers: {
        "Authorization": '563492ad6f91700001000001a3adc7cc48284d49bbd7cd27ed5a39c9'
      });
      print(response.body.toString());

      Map<String, dynamic> jsonData = jsonDecode(response.body);
      jsonData["photos"].forEach((element) {
        //print(element);
        WallpaperModel wallpaperModel = new WallpaperModel();
        wallpaperModel = wallpaperModelFromJson(element);
        wallpapers.add(wallpaperModel);
      });
      setState(() {});
    }catch(e){
      e.printStackTrace();
    }


  }
  @override
  void initState() {
    getTrendingWallpapers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appname(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
            child:Column(
              children: <Widget>[
                SizedBox(height: 16,),
                wallpaperList(wallpapers: wallpapers,context: context),
              ],
            ) ,
        ),
      ),
    );
  }
}
