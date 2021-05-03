import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_room/screens/keyword.dart';
import 'VedioPage.dart';
import 'package:video_player/video_player.dart';
import 'widget.dart';
import 'utl/network.dart';

class Home extends StatefulWidget {
  static String id = "HomeScreen";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic drobDowenVal1 = 'Transcript';
  List<dynamic> l1 = ['Transcript', 'summry25', 'summry50' , 'summry75'];
  onChamge1(dynamic newVal) {
    setState(() {
      drobDowenVal1 = newVal;
    });
  }

  dynamic drobDowenVal2 = 'English';
  List<dynamic> l2 = ['English', 'Arabic'];
  onChamge2(dynamic newVal) {
    setState(() {
      drobDowenVal2 = newVal;
    });
  }

  NetworkHelper _nHelper = NetworkHelper();
  var data;
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _nHelper.fetchData();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  }
                  return Text("${snapshot.error}");
                }),
            FutureBuilder(
              future: _nHelper.fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  data = snapshot.data;
                  return ListTile(
                      title: text(data['title'], Colors.black, 20.0),
                      subtitle: Text('number of views'));
                }
                return Text("${snapshot.error}");
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
                          Text(data['transcript'])
                        ],
                      ),
                    );
                  }
                  return Text("${snapshot.error}");
                },
              ),
            ),
            Container(
                color: Colors.blue[600],
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DropdownButton(
                        value: drobDowenVal1,
                        style: TextStyle(color: Colors.grey),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        elevation: 8,
                        items:
                            l1.map<DropdownMenuItem<dynamic>>((dynamic value) {
                          return DropdownMenuItem<dynamic>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: onChamge1),
                    DropdownButton(
                        value: drobDowenVal2,
                        style: TextStyle(color: Colors.grey),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        elevation: 8,
                        items:
                            l2.map<DropdownMenuItem<dynamic>>((dynamic value) {
                          return DropdownMenuItem<dynamic>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: onChamge2),
                    RaisedButton(
                      color: Colors.white,
                      elevation: 20,
                      child: Text(
                        'Keyword',
                        style: TextStyle(color: Colors.blue[600]),
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
//'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
