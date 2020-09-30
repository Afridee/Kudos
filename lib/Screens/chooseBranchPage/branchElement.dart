import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudos/Constants.dart';
import 'package:kudos/Screens/Home.dart';
import 'package:kudos/Screens/loginPages/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class branch extends StatelessWidget {

  final String img;
  final String branchName;
  final String location;

  const branch({
    Key key,@required this.img,@required this.branchName,@required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            primaryLight,
            primaryDark,
          ]),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  img,
                ),
              ),
            ),
            SizedBox(height: 10),
            AutoSizeText(branchName,
                style: TextStyle(
                  color: Color(0xffE6E6E6),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(location,
                  style: TextStyle(
                    color: Color(0xffE6E6E6),
                    fontFamily: 'Montserrat',
                    fontSize: 14.0,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                final auth  = Provider.of<FirebaseAuthService>(context, listen: false);
                print(auth.userID);
                print(auth.userInfoGiven);
                print(auth.userInfo);
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                  new Home(),
                );
                Navigator.of(context).push(route);
              },
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                    color: Color(0xffE6E6E6),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    )),
                child: Center(
                  child: Text(
                    'Select',
                    style: TextStyle(color: primaryDark, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}