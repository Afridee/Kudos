import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kudos/Constants.dart';
import 'package:kudos/Screens/chooseBranchPage/branchElement.dart';


class chooseBranch extends StatefulWidget {
  @override
  _chooseBranchState createState() => _chooseBranchState();
}

class _chooseBranchState extends State<chooseBranch> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/loginScreenBackground.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Please select your desired franchise...',
                  style: GoogleFonts.pacifico(fontSize: 30, color: primaryDark),
                   textAlign: TextAlign.center,
                ),
              ),
              branch(img: 'assets/images/kudos_uttara.png', branchName: 'Uttara', location:'Plot-26, Gausul, Azam Avenue, Sector-13'),
              branch(img: 'assets/images/kudos_dhanmondi.png', branchName: 'Dhanmondi', location:'1/5 Block D, Lalmatia'),
              branch(img: 'assets/images/kudos_mirpur.png', branchName: 'Mirpur', location:'House 5-6 Lane-15, Block-D, Section-6'),
              branch(img: 'assets/images/kudos_mohammadpur.png', branchName: 'Mohammadpur', location:'Y/10 Nurjahan road')
            ],
          ),
        ),
      ),
    );
  }
}


