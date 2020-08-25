import 'package:kudos/Screens/loginPages/emaiLogInStateManagement.dart';
import 'package:kudos/Screens/loginPages/firebase_auth_service.dart';
import 'package:kudos/Screens/loginPages/phoneNumberStateManagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> LogInWithFacebook(BuildContext context) async {
  final auth = Provider.of<FirebaseAuthService>(context, listen: false);
  final user = await auth.fbLogin();
}

Future<void> LogInWIthGoogle(BuildContext context) async {
  final auth = Provider.of<FirebaseAuthService>(context, listen: false);
  final user = await auth.googleLogin();
}


LogInWithOTP(BuildContext context, String smsCode,phoneNumberStateClass phoneState) async{
  final _firebaseAuth = FirebaseAuth.instance;
  try{
    AuthCredential authCreds = PhoneAuthProvider.getCredential(verificationId: phoneState.verificationID, smsCode: smsCode.trim());
    await _firebaseAuth.signInWithCredential(authCreds);
    Navigator.of(context).pop();
  }catch(e){
    phoneState.getErrorWhileEnteringOTP(e.message);
  }
}

LogInWIthPhone(phoneNumberStateClass phoneState, BuildContext context) async{
  final auth = Provider.of<FirebaseAuthService>(context, listen: false);
  auth.LogInWIthPhone(phoneState, context);
}

Future<void> SignInWIthEmail(BuildContext context,emaiLogInStateClass emaiLogInState) async {
    final auth = Provider.of<FirebaseAuthService>(context, listen: false);
    final user = await auth.signInWithEmail(emaiLogInState);
}

Future<void> SignUpWIthEmail(BuildContext context,emaiLogInStateClass emaiLogInState) async {
  final auth = Provider.of<FirebaseAuthService>(context, listen: false);
  final user = await auth.signUpWithEmail(emaiLogInState);
  if(user!=null){
    Navigator.of(context).pop();
  }
}

Future<void> signOut(BuildContext context) async {
  final _firebaseAuth = FirebaseAuth.instance;
  try {
    await _firebaseAuth.signOut();
    Navigator.of(context).pop();
  } catch (e) {
    print(e);
  }
}