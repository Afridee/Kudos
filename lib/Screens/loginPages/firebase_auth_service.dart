import 'package:kudos/Screens/loginPages/emaiLogInStateManagement.dart';
import 'package:kudos/Screens/loginPages/phoneNumberStateManagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

@immutable
class User {
  const User({@required this.uid});
  final String uid;
}

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user == null ? null : User(uid: user.uid);
  }

  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  Future<User> fbLogin() async {
    FacebookLogin facebookSignIn  = new FacebookLogin();
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

        final FacebookAccessToken accessToken = result.accessToken;

        final authResult = await  FirebaseAuth.instance.signInWithCredential(
          FacebookAuthProvider.getCredential(
              accessToken: accessToken.token),
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
        final GoogleSignInAccount currentUser = _googleSignIn.currentUser;
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        final FirebaseUser user = (await _firebaseAuth.signInWithCredential(credential)).user;

        return _userFromFirebase(user);
  }

  Future<String> getCurrentUserUID() async {
    final auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();
    String userID = user.uid;

    return userID;
  }

  Future<void> LogInWIthPhone(phoneNumberStateClass phoneState, BuildContext context) async{

    final _firebaseAuth = FirebaseAuth.instance;

    final PhoneVerificationCompleted verified = (AuthCredential authresult) async{
      await _firebaseAuth.signInWithCredential(authresult);
      Navigator.of(context).pop();
    };

    final PhoneVerificationFailed verificationfailed = (AuthException authException){
        phoneState.getErrorWhileEnteringPhoneNumber('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]){
        phoneState.setverificationID(verId);
    };


    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId){
        phoneState.setverificationID(verId);
    };

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneState.countryCode+phoneState.phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: null);
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