import 'package:mobx/mobx.dart';

part 'emaiLogInStateManagement.g.dart';

class emaiLogInStateClass = emaiLogInState with _$emaiLogInStateClass;

abstract class emaiLogInState with Store{

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String errorWhileSigningUp = '';

  @observable
  String errorWhileSigningIn = '';

  @action
  void setEmail(String email) {
    this.email = email;
  }

  @action
  void setPassword(String password) {
    this.password = password;
  }

  @action
  void getErrorWhileSigningUp(String errorWhileSigningUp) {
    this.errorWhileSigningUp = errorWhileSigningUp;
  }

  @action
  void getErrorWhileSigningIn(String errorWhileSigningIn) {
    this.errorWhileSigningIn = errorWhileSigningIn;
  }

}