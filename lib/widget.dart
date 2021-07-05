import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';


Widget text(String text, Color color, double size, FontWeight fontWeight) {
  return Text(
    '$text',
    style: TextStyle(color: color, fontSize: size ),
  );
}

Widget iconLine() {
  return Padding(
    padding: EdgeInsets.only(bottom: 20.0 ,top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            iconItems(Icons.thumb_up, '21k'),
            iconItems(Icons.thumb_down, '5'),
          ],
        ),
  );
}

Widget iconItems(IconData icon, String def) {
  return Column(
    children: [
      Container(
        child: Icon(
          icon,
          color: Colors.grey[700],
        ),
      ),
      text(def, Colors.grey[700], 20.0 ,FontWeight.w100)
    ],
  );
}

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
    String id,
    child,
)
{

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
                  child: child,
                ),),
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
