import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kudos/Screens/loginPages/firebase_auth_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '../../Constants.dart';
import 'formTextField.dart';
import 'form_submission.dart';
import 'stateManagement/states.dart';

class infoForm extends StatefulWidget {

  final Title;

  const infoForm({Key key,@required this.Title}) : super(key: key);

  @override
  _infoFormState createState() => _infoFormState();
}

class _infoFormState extends State<infoForm> {
  Edit_or_complete_profileStateClass ECS;
  TextEditingController _firstName;
  TextEditingController _lastName;
  TextEditingController _phoneNumber;
  TextEditingController _Address;


  @override
  void initState() {
     ECS = new Edit_or_complete_profileStateClass();
    _firstName = new TextEditingController();
    _lastName = new TextEditingController();
    _phoneNumber = new TextEditingController();
    _Address = new TextEditingController();

    final auth = Provider.of<FirebaseAuthService>(context, listen: false);

    if(auth.userInfo!=null){
      _firstName.text = auth.userInfo['first_name'];
      _lastName.text = auth.userInfo['last_name'];
      _phoneNumber.text = auth.userInfo['phone_number'];
      _Address.text = auth.userInfo['address'];
    }

    super.initState();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _phoneNumber.dispose();
    _Address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<FirebaseAuthService>(context, listen: true);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return WillPopScope(
      onWillPop: () async => auth.userInfoGiven,
      child: Observer(
        builder: (context){
          return ModalProgressHUD(
            progressIndicator: CircularProgressIndicator(
              valueColor:
              new AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: primaryDark,
            ),
            inAsyncCall: ECS.Spinner,
            color: primaryDark,
            child: Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(widget.Title,
                        style: TextStyle(
                            color: primaryDark,
                            fontSize: 28,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    formTextfield(
                        label: 'First Name',
                        textController: _firstName,
                        inputType: TextInputType.text),
                    formTextfield(
                        label: 'Last Name',
                        textController: _lastName,
                        inputType: TextInputType.text),
                    formTextfield(
                        label: 'Phone Number',
                        textController: _phoneNumber,
                        inputType: TextInputType.number),
                    formTextfield(
                        label: 'Address',
                        textController: _Address,
                        inputType: TextInputType.text),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () async {
                          ECS.setSpinner();
                          Done(context, _firstName.text, _lastName.text, _phoneNumber.text, _Address.text);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                primaryLight,
                                primaryDark,
                              ])),
                          child: Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}