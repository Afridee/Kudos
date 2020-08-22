import 'package:kudos/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginCustomizedButton extends StatelessWidget {

  final String buttonText;

  const loginCustomizedButton({
    Key key,@required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
         gradient: LinearGradient(colors: [
            primaryLight,
            primaryDark,
          ])),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}