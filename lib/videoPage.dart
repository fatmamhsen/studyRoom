import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_room/screens/keyword.dart';
import 'package:study_room/vedio.dart';
import 'widget.dart';
import 'package:study_room/utl/vedio_module.dart' as v;
import 'package:study_room/utl/network.dart';

class VideoPage extends StatefulWidget {
  static String id = 'VideoPage';
  final loId;
  VideoPage({this.loId});
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  dynamic dropDownVal1 = 'Transcript';
  List<dynamic> l1 = ['Transcript', 'summry25', 'summry50', 'summry75'];
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

      dropDownVal2 = newVal;
    });
  }
  var data;
  Future<v.Video> futureData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = fetchData(widget.loId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: FutureBuilder<v.Video>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      data = snapshot.data;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          child: Video(videoUrl: data.loSignedUrl),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3.0,
                    color: Colors.blue[600],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  )),
              child: Expanded(
                child: FutureBuilder(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      data = snapshot.data;
                      return Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: ListTile(
                          title: text(
                              data.title, Colors.black, 20.0,FontWeight.bold),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
            iconLine(),
            Expanded(
              child: FutureBuilder(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Scrollbar(
                      child: Container(
                        height: 300.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.0,
                              color: Colors.blue[600],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: ListView(
                            children: <Widget>[
                              Text(
                                data.transcript,
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
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
                  children: [
                    DropdownButton(
                        dropdownColor: Colors.blue[600],
                        value: dropDownVal1,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: 38,
                        items:
                            l1.map<DropdownMenuItem<dynamic>>((dynamic value) {
                          return DropdownMenuItem<dynamic>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: onChange1),
                    DropdownButton(
                        dropdownColor: Colors.blue[600],
                        value: dropDownVal2,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: 38,
                        items:
                            l2.map<DropdownMenuItem<dynamic>>((dynamic value) {
                          return DropdownMenuItem<dynamic>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: onChange2),

                    // ignore: deprecated_member_use
                    RaisedButton(
                      color: Colors.blue[600],
                      elevation: 0.0,
                      child: Text(
                        'Keywords',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      // Within the `FirstRoute` widget
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KeywordPage(
                                    loId: widget.loId,
                                  )),
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
