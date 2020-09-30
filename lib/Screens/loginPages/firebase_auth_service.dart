import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kudos/Screens/loginPages/emaiLogInStateManagement.dart';
import 'package:kudos/Screens/loginPages/phoneNumberStateManagement.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

@immutable
class User {
  const User({@required this.uid});
  final String uid;
}

class FirebaseAuthService extends ChangeNotifier{

  final _firebaseAuth = fba.FirebaseAuth.instance;

  FirebaseAuthService(){
    getCurrentUserUID();
  }

  String _userID = '';
  String get userID => _userID;

  bool _userInfoGiven = true;
  bool get userInfoGiven => _userInfoGiven;

  Map<String, dynamic> _userInfo;
  Map<String, dynamic> get userInfo => _userInfo;

  User _userFromFirebase(fba.User user) {
    return user == null ? null : User(uid: user.uid);
  }

  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  Future<User> fbLogin() async {
    FacebookLogin facebookSignIn  = new FacebookLogin();
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

        final FacebookAccessToken accessToken = result.accessToken;

        final authResult = await  fba.FirebaseAuth.instance.signInWithCredential(
          fba.FacebookAuthProvider.credential(accessToken.token),
        );

        return _userFromFirebase(authResult.user);
  }

  Future<User> googleLogin() async {

        GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: [
            'email',
          ],
        );

        final GoogleSignInAccount googleUser = await _googleSignIn.signIn().catchError((onError) {});
        //final GoogleSignInAccount currentUser = _googleSignIn.currentUser;
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final fba.AuthCredential credential = fba.GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        final fba.User user = (await _firebaseAuth.signInWithCredential(credential)).user;

        return _userFromFirebase(user);
  }

    getCurrentUserUID(){
      try{
        final auth = fba.FirebaseAuth.instance;
        final fba.User user = auth.currentUser;
        _userID = user.uid;
        notifyListeners();
        if(_userID!=null){
          getCurrentUserINFO();
        }
      }catch(e){
        print(e);
      }
  }

  getCurrentUserINFO() async{
    try {
      await FirebaseFirestore.instance.doc("users/${userID}").get().then((doc) {
        if (doc.exists){
          _userInfoGiven = true;
          _userInfo = doc.data();
          notifyListeners();
        }
        else{
          _userInfoGiven = false;
          notifyListeners();
        }
      });
    } catch (e) {
       print(e);
    }
  }

  Future<void> LogInWIthPhone(phoneNumberStateClass phoneState, BuildContext context) async{

    final _firebaseAuth = fba.FirebaseAuth.instance;

    final fba.PhoneVerificationCompleted verified = (fba.AuthCredential authresult) async{
      await _firebaseAuth.signInWithCredential(authresult);
      getCurrentUserUID();
      Navigator.of(context).pop();
    };

    final fba.PhoneVerificationFailed verificationfailed = (fba.FirebaseAuthException authException){
        phoneState.getErrorWhileEnteringPhoneNumber('${authException.message}');
    };

    final fba.PhoneCodeSent smsSent = (String verId, [int forceResend]){
        phoneState.setverificationID(verId);
    };


    final fba.PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId){
        phoneState.setverificationID(verId);
    };

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneState.countryCode+phoneState.phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

  Future<User> signUpWithEmail(emaiLogInStateClass emaiLogInState) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: emaiLogInState.email, password: emaiLogInState.password);
      await authResult.user.sendEmailVerification();
      return _userFromFirebase(authResult.user);
    } catch (e) {
      emaiLogInState.getErrorWhileSigningUp(e.message);
    }
  }

  Future<User> signInWithEmail(emaiLogInStateClass emaiLogInState) async {
    try {
      final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: emaiLogInState.email, password: emaiLogInState.password);
      return _userFromFirebase(authResult.user);
    } catch (e) {
      emaiLogInState.getErrorWhileSigningIn(e.message);
    }
  }



}