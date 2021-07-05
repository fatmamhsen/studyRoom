import 'package:flutter/material.dart';
import 'package:study_room/widget.dart';
import 'package:study_room/utl/vedio_module.dart' as v;
import 'package:study_room/utl/network.dart';

class KeywordPage extends StatefulWidget {
  static String id = "KeywordPage";
  final loId;
  KeywordPage({this.loId});
  @override
  _KeywordPageState createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
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
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 36.0, horizontal: 24.0),
                    child: Center(
                      child: Text(
                        'Keywords',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                        child: FutureBuilder(
                          future: futureData,
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              data = snapshot.data;
                              return ListView.builder(
                                  itemCount: data.keywords.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 100,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(40.0),
                                        ),
                                      ),
                                      child: Card(
                                        margin: EdgeInsets.all(10.0),
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Word:                 ${data.keywords[index].word}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              cardLink(
                                                  'Yotube Link :       ',
                                                  data.keywords[index]
                                                          .youtubeLink ??
                                                      'No Link'),
                                              cardLink(
                                                  'Wikipedia Link :  ',
                                                  data.keywords[index]
                                                          .wikipediaLink ??
                                                      'No Link')
                                            ],
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
                        )))
              ]),
        ),
      ),
    );
  }
}
