import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_room/home.dart';
import 'package:study_room/widget.dart';

class ListOfObject extends StatefulWidget {

  static String id = "ListOfObject";
  @override
  _ListOfObjectState createState() => _ListOfObjectState();
}

class _ListOfObjectState extends State<ListOfObject> {

  var titleList = [
    "Medicine1",
  ];

  // Description List Here
  var descList = [
    "Medicine is the art",
  ];

  // Image Name List Here
  var imgList = [
    "images/pic1.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: singleChildScroll(context, 'List Of Object', imgList,  titleList, descList,Home.id)
    );
  }
}