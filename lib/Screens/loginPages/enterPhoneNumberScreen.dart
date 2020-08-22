import 'package:kudos/Constants.dart';
import 'package:kudos/Screens/loginPages/loginButtonStyles.dart';
import 'package:kudos/Screens/loginPages/loginTextFields.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:kudos/Screens/loginPages/phoneNumberStateManagement.dart';
import 'package:kudos/Screens/loginPages/loginFunctionalities.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:otp_text_field/otp_text_field.dart';

Widget _buildImage(String assetName) {
  return Align(
    child: Image.asset('assets/images/$assetName.png', width: 200.0),
    alignment: Alignment.bottomCenter,
  );
}

class enterPhoneNumber extends StatefulWidget {
  @override
  _enterPhoneNumberState createState() => _enterPhoneNumberState();
}

class _enterPhoneNumberState extends State<enterPhoneNumber> {
  TextEditingController phoneNumber;
  phoneNumberStateClass PNS;

  @override
  void initState() {
    PNS = new phoneNumberStateClass();
    phoneNumber = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone verification'),
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
      body: Observer(
        builder: (context) {
          return PNS.verificationID == ''
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xfff3f3f3),
                  child: Container(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Enter your phone number to verify and log in.',
                            style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w700,
                                color: primaryDark),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildImage('phoneVerification'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: CountryCodePicker(
                                    onChanged: (value) {
                                      PNS.setCountryCode(value.toString());
                                    },
                                    initialSelection: 'Bangladesh',
                                    favorite: ['+880', 'BD'],
                                    showFlagDialog: false,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                      child: loginTextfield(
                                          labelText: 'Enter phone number',
                                          hideText: false,
                                          textController: phoneNumber))),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Observer(
                              builder: (context){
                                return Center(
                                  child: PNS.errorWhileEnteringPhoneNumber==''? Text(
                                    '(Note: Select the country code and type the rest)',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 10),
                                  ) : Text(
                                    PNS.errorWhileEnteringPhoneNumber,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 10),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: InkWell(
                            child: loginCustomizedButton(buttonText: 'Send verification code'),
                            onTap: () {
                              PNS.setPhoneNumber(phoneNumber.text);
                              LogInWIthPhone(PNS, context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ))
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xfff3f3f3),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Please enter the sms code we\'ve sent you.',
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w700,
                              color: primaryDark),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildImage('otp'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 30,
                        style: TextStyle(fontSize: 20),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        //fieldStyle: FieldStyle.underline,
                        onCompleted: (pin) {
                          LogInWithOTP(context, pin, PNS);
                        },
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Observer(
                            builder: (context){
                              return Center(
                                child: Text(
                                  PNS.errorWhileEnteringOTP,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 10),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ));
        },
      ),
    );
  }
}
