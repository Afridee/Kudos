import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

snackBar({BuildContext context, String text, Widget trailingIcon, Color bgColor, Color textColor, int duration}){
  Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: new Duration(seconds: duration),
      content: Row(
        children: <Widget>[
          Text('Added to cart',
            style: TextStyle(
                color: textColor
            ),),
          SizedBox(
            width: 10,
          ),
          trailingIcon,
        ],
      ),
      backgroundColor: bgColor,
    ),
  );
}