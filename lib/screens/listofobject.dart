import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_room/utl/network.dart';
import 'package:study_room/utl/object_module.dart';
import 'package:study_room/widget.dart';
import '../videoPage.dart';
import 'login.dart';

// ignore: must_be_immutable
class ListOfObject extends StatefulWidget {
  static String id = 'ListOfObject';
  var lessonCode;
  var courseCode;
  ListOfObject({this.lessonCode ,this.courseCode});
  @override
  _ListOfObjectState createState() => _ListOfObjectState();
}

class _ListOfObjectState extends State<ListOfObject> {
   Future <Object> futureLessonObject;
  @override
  void initState() {
    super.initState();
    futureLessonObject = fetchLessonObjects(widget.courseCode,widget.lessonCode);
  }
  Object data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: singleChildScroll(context, 'List of Object',Login.id,
          FutureBuilder<Object>(
            future: futureLessonObject,
            builder: (_, snapshot){
              if (snapshot.hasData){
                data=snapshot.data;
                return ListView(
                  children: data.topics.map((e) => Column(
                    children: e.subTopics.map((e) => Column(
                      children:e.subSubTopics.map((e) => Visibility(
                        visible: e.lOid.isNotEmpty,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>VideoPage(loId: e.lOid,)));
                          },
                          child: Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                              ),
                            child: Card(
                              elevation: 3.0,
                              margin: EdgeInsets.all(10.0),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(e.title ?? 'No title',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ),
                      )).toList() ,)).toList(),)).toList(),
                );

              }else if(snapshot.hasError){
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          )
      ),
    );
  }
}

