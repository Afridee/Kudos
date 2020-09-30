import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kudos/Screens/chooseBranchPage/chooseBranchScreen.dart';
import 'package:kudos/Screens/loginPages/firebase_auth_service.dart';
import 'package:provider/provider.dart';


Done(BuildContext context, String first_name, String last_name, String phoneNumber, String address) async{

  final auth  = Provider.of<FirebaseAuthService>(context, listen: false);
  String userID = auth.userID;

  try{
    if(first_name.length>0 &&
        last_name.length>0 &&
        phoneNumber.length>0 &&
        address.length>0){

      final CollectionReference users = FirebaseFirestore.instance.collection('users');

      await users.doc(userID).set({
        'first_name' : first_name,
        'last_name' : last_name,
        'phone_number' : phoneNumber,
        'address' : address,
      },);

      auth.getCurrentUserINFO();

      var route = new MaterialPageRoute(
        builder: (BuildContext context) => new chooseBranch(),
      );
      Navigator.of(context).push(route);
    }
  }catch(e){
    print(e);
  }
}