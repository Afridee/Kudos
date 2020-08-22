import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginTextfield extends StatelessWidget {

  final String labelText;
  final bool hideText;
  final TextEditingController textController;

  const loginTextfield({
    Key key,@required this.labelText,@required this.hideText,@required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey[100]))),
      child: TextField(
        controller: textController,
        obscureText: hideText,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {

        },
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            hintStyle: TextStyle(
                color: Colors.grey[400])),
      ),
    );
  }
}