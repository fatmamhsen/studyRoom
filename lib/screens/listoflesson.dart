import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_room/utl/lesson_module.dart';
import 'package:study_room/utl/network.dart';
import 'listofobject.dart';
import 'package:study_room/widget.dart';
import 'login.dart';

// ignore: must_be_immutable
class ListOfLesson extends StatefulWidget {
  static String id = 'ListOfLessons';
  var courseCode;
  var lessonCode;
  ListOfLesson({this.courseCode});
  @override
  _ListOfLessonState createState() => _ListOfLessonState();
}

class _ListOfLessonState extends State<ListOfLesson> {
  Future<List<Lesson>> futureCourseLesson;
  @override
  void initState() {
    super.initState();
    futureCourseLesson = fetchCourseLessons(widget.courseCode);
  }

  var data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: singleChildScroll(
          context,
          'List of Lessons',
          Login.id,
          FutureBuilder<List<Lesson>>(
            future: futureCourseLesson,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                data = snapshot.data;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ListOfObject(
                                    lessonCode: data[index].lessonCode,
                                    courseCode: data[index].courseCode,
                                  )));
                        },

                        // Card Which Holds Layout Of ListView Item
                        child: Card(
                          elevation: 3.0,
                          margin: EdgeInsets.all(15.0),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data[index].title ?? 'No title',
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
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
