import 'package:flutter/material.dart';

//function 5:
void appShowDialog(BuildContext context, String title, String content, Color
color) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(
          title,
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontFamily: 'Varela'),
        ),
        content: new Text(
          content,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontFamily: 'Varela'),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text(
              "OK",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontFamily: 'Varela',
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        backgroundColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      );
    },
  );
}