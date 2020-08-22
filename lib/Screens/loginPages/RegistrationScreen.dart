import 'package:kudos/Constants.dart';
import 'package:kudos/Screens/loginPages/emaiLogInStateManagement.dart';
import 'package:kudos/Screens/loginPages/loginButtonStyles.dart';
import 'package:kudos/Screens/loginPages/loginFunctionalities.dart';
import 'package:kudos/Screens/loginPages/loginTextFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

//Just to build images:
Widget _buildImage(String assetName) {
  return Align(
    child: Image.asset('assets/images/$assetName.jpg', width: 200.0),
    alignment: Alignment.bottomCenter,
  );
}

class RegistrationScreen extends StatefulWidget {
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final emaiLogInStateClass ELS;

  const RegistrationScreen(
      {Key key,
      this.emailTextController,
      this.passwordTextController,
      this.ELS})
      : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Registration with email'),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              primaryLight,
              primaryDark,
            ]),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            _buildImage('contattami'),
            loginTextfield(
                hideText: false,
                labelText: 'email',
                textController: widget.emailTextController),
            loginTextfield(
                hideText: true,
                labelText: 'password',
                textController: widget.passwordTextController),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                child: loginCustomizedButton(buttonText: 'Sign Up'),
                onTap: () {
                  SignUpWIthEmail(context, widget.ELS);
                },
              ),
            ),
            Observer(
              builder: (context) {
                return Text(
                  widget.ELS.errorWhileSigningUp,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 10),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
