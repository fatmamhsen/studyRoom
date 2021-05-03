import 'package:flutter/material.dart';
import 'package:study_room/screens/listoflesson.dart';
import 'package:study_room/widget.dart';


class MyCourse extends StatefulWidget {

  static String id = "MyCourse";
  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {


  var titleList = [
    "Medicine",
    "Business",
    "Network",
    "Medicine",
    "Business",
    "Network",
    "Medicine",
    "Business",
    "Network",
  ];

  // Description List Here
  var descList = [
    "Medicine is the art",
    "Microsoft Power",
    "Computer Network",
    "Medicine is the art",
    "Microsoft Power",
    "Computer Network",
    "Medicine is the art",
    "Microsoft Power",
    "Computer Network",
  ];

  // Image Name List Here
  var imgList = [
    "images/pic1.jpg",
    "images/pic1.jpg",
    "images/pic1.jpg",
    "images/pic1.jpg",
    "images/pic1.jpg",
    "images/pic1.jpg",
    "images/pic1.jpg",
    "images/pic1.jpg",
    "images/pic1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: singleChildScroll(context, 'My Courses', imgList,  titleList, descList,ListOfLesson.id)

    );
  }
}