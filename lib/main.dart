import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_room/screens/keyword.dart';
import 'VedioPage.dart';
import 'package:video_player/video_player.dart';
import 'widget.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic drobDowenVal1 = '100%';
  List<dynamic> l1 = ['100%', '75%', '50%'];
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              VedioPage(
                videoPlayerController: VideoPlayerController.network(
                    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
              ),
              ListTile(
                title: text('Vedio Name', Colors.black, 20.0),
                subtitle: Text('number of views'),
              ),
              iconLine(),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    text(
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.'
                        'The decoration to paint behind the child.',
                        Colors.black,
                        15.0)
                  ],
                ),
              ),
              Container(
                  color: Colors.indigo,
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
                          items: l1
                              .map<DropdownMenuItem<dynamic>>((dynamic value) {
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
                          items: l2
                              .map<DropdownMenuItem<dynamic>>((dynamic value) {
                            return DropdownMenuItem<dynamic>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: onChamge2),
                      RaisedButton(
                        color: Colors.indigo,
                        elevation: 20,
                        child: Text(
                          'Keyword',
                          style: TextStyle(color: Colors.white),
                        ),
                          // Within the `FirstRoute` widget
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => KeywordPage()),
                          );
                        },

                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

}
