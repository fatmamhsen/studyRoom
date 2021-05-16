import 'package:flutter/material.dart';
import 'package:study_room/home.dart';
import 'package:study_room/screens/keyword.dart';
import 'package:study_room/screens/listofcourse.dart';
import 'package:study_room/screens/listofLesson.dart';
import 'package:study_room/screens/listofobject.dart';
import 'package:study_room/VedioPage.dart';
import 'package:study_room/screens/login.dart';

void main() => runApp(MaterialApp(
title: "Study Room App",
initialRoute: Login.id,
routes: {
Home.id :(context)  => Home(),
  Login.id: (context) => Login(),
  MyCourse.id : (context) => MyCourse(),
  ListOfLesson.id : (context) => ListOfLesson(),
  ListOfObject.id : (context) => ListOfObject(),
  VideoPage.id : (context) => VideoPage(),
  Home.id : (context) => Home(),
  KeywordPage.id : (context) => KeywordPage(),
},));


