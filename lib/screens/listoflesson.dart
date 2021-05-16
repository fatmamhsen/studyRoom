import 'package:flutter/material.dart';

import 'listofobject.dart';
import 'package:study_room/widget.dart';


class ListOfLesson extends StatefulWidget {
  static String id = "ListOfLesson";

  @override
  _ListOfLessonState createState() => _ListOfLessonState();
}

class _ListOfLessonState extends State<ListOfLesson> {


  var titleList = [
    "Medicine1",
    "Medicine2",
    "Medicine3",
  ];

  // Description List Here
  var descList = [
    "Medicine is the art",
    "Medicine is the art",
    "Medicine is the art",
  ];

  // Image Name List Here
  var imgList = [
    "images/pic1.jpg",
    "images/pic1.jpg",
    "images/pic1.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: singleChildScroll(context, 'List Of Lesson', imgList,  titleList, descList,ListOfObject.id)
    );
  }
}

