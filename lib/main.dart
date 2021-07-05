import 'package:flutter/material.dart';
import 'package:study_room/screens/keyword.dart';
import 'package:study_room/screens/listofLesson.dart';
import 'package:study_room/screens/listofobject.dart';
import 'package:study_room/screens/login.dart';
import 'package:study_room/screens/listofcourse.dart';
import 'package:study_room/videoPage.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,

initialRoute: Login.id,

title: "Study Room App",
routes: {

  Login.id: (context) => Login(),
  MyCourse.id : (context) => MyCourse(),
  ListOfLesson.id: (context)=>ListOfLesson(),
  ListOfObject.id: (context)=>ListOfObject(),
  KeywordPage.id :(context)=>KeywordPage(),
  VideoPage.id : (context)=> VideoPage(),


},));


