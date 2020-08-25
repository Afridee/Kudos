import 'package:kudos/Constants.dart';
import 'package:flutter/material.dart';

class confirmPart extends StatelessWidget {
  const confirmPart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff0f0f0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 8.0, top: 8.0, left: 120, right: 120),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: primaryLight,
                width: 2
              ),
            gradient: LinearGradient(
                colors: [
                  primaryDark,
                  primaryDark,
                ]
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              'Confirm',
              style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}