import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_room/widget.dart';
class KeywordPage extends StatefulWidget {
  @override
  _KeywordPageState createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: text('KeyWord',Colors.white,25.0),
          elevation: 25.0,
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Text('cv'),
        ),
      ),
    );
  }
}
