import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasawallpaperapp/apiModel.dart';

Widget appname(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text("NASA",
    style: TextStyle(fontWeight: FontWeight.bold,
    color: Colors.black87),),
    Text("APOD",
      style: TextStyle(fontStyle: FontStyle.italic,
      color: Colors.blue,
      fontWeight: FontWeight.bold))
  ],);
}

Widget wallpaperList({List<WallpaperModel> wallpapers, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
        crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper){
       return GridTile(
         child: Container(
           child: Image.network(wallpaper.photos[0].src.portrait),
         ),
       );
      }).toList(),
    ),
  );
}