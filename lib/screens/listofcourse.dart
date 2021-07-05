import 'package:flutter/material.dart';
import 'package:study_room/utl/course_module.dart';
import 'package:study_room/utl/network.dart';
import 'package:study_room/widget.dart';
import 'listoflesson.dart';

class MyCourse extends StatefulWidget {
  static String id = "MyCourse";
  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {

   Future <List<Course>> futureCourses;
  @override
  void initState() {
    super.initState();
    futureCourses = fetchCourses();

  }
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: singleChildScroll(context, 'List of Courses',ListOfLesson.id,
          FutureBuilder<List<Course>>(
            future: futureCourses,
            builder: (_, snapshot){
              if (snapshot.hasData){
                data=snapshot.data;
                return ListView.builder(
                    itemCount: data.length ,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context)=>ListOfLesson(courseCode:data[index].courseCode ,)));
                        },
                        // Card Which Holds Layout Of ListView Item
                        child: Stack(
                          fit: StackFit.passthrough,
                          children :[
                            Card(
                              elevation: 3.0,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                     color: Colors.grey,
                                     width: 100.0,
                                     height: 100.0,
                                     child: Image.network(data[index].image??'No image'),
                                     //Text(data[index].image??'No image')
                                        ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 40.0 , top: 40.0),
                                      child: Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(data[index].title??'No Title',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Text(data[index].title??'No title'))
                                      ),
                                    ),
                                  ],
                              ),
                          ),
                      ],
                        ),
                      );
                    }
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