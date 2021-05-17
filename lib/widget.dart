import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';


Widget text(String text, Color color, double size) {
  return Text(
    '$text',
    style: TextStyle(color: color, fontSize: size),
  );
}

// The Row of icons under video
Widget iconLine() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      iconItems(Icons.thumb_up, 1),
      iconItems(Icons.thumb_down,1 ),
//      iconItems(Icons.share, ),
//      iconItems(Icons.save_alt, ),
    ],
  );
}

// icon under video
Widget iconItems(IconData icon , int num) {
  return Column(
    children: [
      Container(
        child: IconButton(icon :  Icon(icon),
        color: Colors.blue[600],
        onPressed : ()=> num++ ,
        ),

      ),
      text('num', Colors.blue[600], 20.0)
    ],
  );
}

//Text field at log in page
Widget textInputField(String text, Icon icon, bool obscure, TextInputType v) {
  return TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Color(0xffe7edeb),
      hintText: text,
      prefixIcon: icon,
    ),
    obscureText: obscure,
    keyboardType: v,
  );
}

// body of List of courses , lessons , object pages
Widget singleChildScroll(
  BuildContext context,
  String appbar,
    imgList , titleList , decList,
   String id
) {
  return SingleChildScrollView(
    child: Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[800], Colors.blue[600]],
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
                padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 24.0),
                child: Center(
                  child: Text(
                    appbar,
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
                  child: ListView.builder(
                      itemCount: imgList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(id);
                            },
                            // Card Which Holds Layout Of ListView Item
                            child: Card(
                                margin: EdgeInsets.all(10.0),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 100.0,
                                        height: 100.0,
                                        child: (Image.asset(imgList[index])),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                      ),
                                      Expanded(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(titleList[index],
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold)),
                                                Text(decList[index]),
                                              ]))
                                    ])));
                      }),
                ))
          ]),
    ),
  );
}

// KeyWord Card information (Links)
Widget cardLink(
    String urlName,
    var url
    ) {
  return
    RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: urlName,
            style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: 'Click Here',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue[600],
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
        ]));
}





