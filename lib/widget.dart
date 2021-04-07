import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget text (String text,Color color,double size){
  return Text ('$text',
    style: TextStyle(
      color: color,
      fontSize: size
    ),
  ) ;
}
Widget iconLine() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
     iconItems(Icons.thumb_up, '21k'),
      iconItems(Icons.thumb_down, '5'),
      iconItems(Icons.share, 'share'),
      iconItems(Icons.save_alt, 'save'),
    ],
  );
}

Widget iconItems (IconData icon, String def){
  return Column(
  children: [
    Container(
      child: Icon(icon,color: Colors.grey[700],),
    ),
    text(def, Colors.grey[700], 20.0)
  ],
  );
}

