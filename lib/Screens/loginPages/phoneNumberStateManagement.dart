import 'package:mobx/mobx.dart';

part 'phoneNumberStateManagement.g.dart';

class phoneNumberStateClass = phoneNumberState with _$phoneNumberStateClass;

abstract class phoneNumberState with Store{

  @observable
  String phoneNumber = '';

  @observable
  String countryCode = '+880';

  @observable
  String verificationID = '';

  @observable
  String errorWhileEnteringPhoneNumber = '';

  @observable
  String errorWhileEnteringOTP = '';

  @action
  void setPhoneNumber(String phoneNumber) {
      this.phoneNumber = phoneNumber;
  }

  @action
  void setCountryCode(String countryCode ) {
    this.countryCode = countryCode;
  }

  @action
  void setverificationID(String verificationID) {
    this.verificationID = verificationID;
  }

  @action
  void getErrorWhileEnteringPhoneNumber(String errorWhileEnteringPhoneNumber) {
    this.errorWhileEnteringPhoneNumber = errorWhileEnteringPhoneNumber;
  }

  @action
  void getErrorWhileEnteringOTP(String errorWhileEnteringOTP) {
    this.errorWhileEnteringOTP = errorWhileEnteringOTP;
  }
}