// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emaiLogInStateManagement.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$emaiLogInStateClass on emaiLogInState, Store {
  final _$emailAtom = Atom(name: 'emaiLogInState.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: 'emaiLogInState.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$errorWhileSigningUpAtom =
      Atom(name: 'emaiLogInState.errorWhileSigningUp');

  @override
  String get errorWhileSigningUp {
    _$errorWhileSigningUpAtom.reportRead();
    return super.errorWhileSigningUp;
  }

  @override
  set errorWhileSigningUp(String value) {
    _$errorWhileSigningUpAtom.reportWrite(value, super.errorWhileSigningUp, () {
      super.errorWhileSigningUp = value;
    });
  }

  final _$errorWhileSigningInAtom =
      Atom(name: 'emaiLogInState.errorWhileSigningIn');

  @override
  String get errorWhileSigningIn {
    _$errorWhileSigningInAtom.reportRead();
    return super.errorWhileSigningIn;
  }

  @override
  set errorWhileSigningIn(String value) {
    _$errorWhileSigningInAtom.reportWrite(value, super.errorWhileSigningIn, () {
      super.errorWhileSigningIn = value;
    });
  }

  final _$emaiLogInStateActionController =
      ActionController(name: 'emaiLogInState');

  @override
  void setEmail(String email) {
    final _$actionInfo = _$emaiLogInStateActionController.startAction(
        name: 'emaiLogInState.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$emaiLogInStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo = _$emaiLogInStateActionController.startAction(
        name: 'emaiLogInState.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$emaiLogInStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getErrorWhileSigningUp(String errorWhileSigningUp) {
    final _$actionInfo = _$emaiLogInStateActionController.startAction(
        name: 'emaiLogInState.getErrorWhileSigningUp');
    try {
      return super.getErrorWhileSigningUp(errorWhileSigningUp);
    } finally {
      _$emaiLogInStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getErrorWhileSigningIn(String errorWhileSigningIn) {
    final _$actionInfo = _$emaiLogInStateActionController.startAction(
        name: 'emaiLogInState.getErrorWhileSigningIn');
    try {
      return super.getErrorWhileSigningIn(errorWhileSigningIn);
    } finally {
      _$emaiLogInStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
errorWhileSigningUp: ${errorWhileSigningUp},
errorWhileSigningIn: ${errorWhileSigningIn}
    ''';
  }
}
