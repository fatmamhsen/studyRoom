import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_room/screens/keyword.dart';
import 'VedioPage.dart';
import 'package:video_player/video_player.dart';
import 'widget.dart';
import 'utl/network.dart';

class Home extends StatefulWidget{
  static String id = "HomeScreen";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic dropDownVal1 = 'Transcript';
  List<dynamic> l1 = ['Transcript', 'summry25', 'summry50' , 'summry75'];
  onChange1(dynamic newVal) {
    setState(() {
      dropDownVal1 = newVal;
    });
  }

  dynamic dropDownVal2 = 'English';
  List<dynamic> l2 = ['English', 'Arabic'];
  onChange2(dynamic newVal) {
    setState(() {
      dropDownVal1 = newVal;
    });
  }
  
 NetworkHelper _nHelper =  NetworkHelper();

  var data;

//  String ar = 'ARABIC';
//  String en = 'ENGLISH';
//  static String ENGLISH = 'en';
//  static String ARABIC = 'ar';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nHelper.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            FutureBuilder(
                future: _nHelper.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    data = snapshot.data;
                    return VideoPage(
                        videoPlayerController: VideoPlayerController.network(
                            '${data["loSignedUrl"]}'));
                  } else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                }),
            FutureBuilder(
              future: _nHelper.fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  data = snapshot.data;
                  return ListTile(
                      title: text(data['title'], Colors.black, 20.0),
                      subtitle: Text('number of views'));
                } else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            iconLine(),
            Expanded(
              child: FutureBuilder(
                future: _nHelper.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Scrollbar(
                      child: ListView(
                        children: <Widget>[
                            Text(data['transcript']
                          ),
                        ],
                      ),
                    );
                  } else if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Container(
                color: Colors.blue[600],
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: DropdownButton(
                        dropdownColor: Colors.blue[600],
                          value: dropDownVal1,
                          style: TextStyle(color: Colors.white,fontSize: 18.0),
                          icon: Icon(Icons.arrow_drop_down ,color: Colors.white,),
                          iconSize: 38,
                          items:
                              l1.map<DropdownMenuItem<dynamic>>((dynamic value) {
                            return DropdownMenuItem<dynamic>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: onChange1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: DropdownButton(
                        dropdownColor: Colors.blue[600],
                          value: dropDownVal2,
                          style: TextStyle(color: Colors.white,fontSize: 18.0),
                          icon: Icon(Icons.arrow_drop_down, color: Colors.white,),
                          iconSize: 38,
                          items:
                              l2.map<DropdownMenuItem<dynamic>>((dynamic value) {
                            return DropdownMenuItem<dynamic>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: onChange2),
                    ),
                    RaisedButton(
                      color: Colors.blue[600],
                      elevation: 0.0,
                      child: Text(
                        'Keywords',
                        style: TextStyle(color: Colors.white,fontSize: 18.0),
                      ),
                      // Within the `FirstRoute` widget
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KeywordPage()),
                        );
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

