// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginScreenStateManagement.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$loginScreenStateClass on loginScreenState, Store {
  final _$SpinnerAtom = Atom(name: 'loginScreenState.Spinner');

  @override
  bool get Spinner {
    _$SpinnerAtom.reportRead();
    return super.Spinner;
  }

  @override
  set Spinner(bool value) {
    _$SpinnerAtom.reportWrite(value, super.Spinner, () {
      super.Spinner = value;
    });
  }

  final _$loginScreenStateActionController =
      ActionController(name: 'loginScreenState');

  @override
  void setSpinner() {
    final _$actionInfo = _$loginScreenStateActionController.startAction(
        name: 'loginScreenState.setSpinner');
    try {
      return super.setSpinner();
    } finally {
      _$loginScreenStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
Spinner: ${Spinner}
    ''';
  }
}
