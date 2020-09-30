// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Edit_or_complete_profileStateClass
    on Edit_or_complete_profileState, Store {
  final _$SpinnerAtom = Atom(name: 'Edit_or_complete_profileState.Spinner');

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

  final _$Edit_or_complete_profileStateActionController =
      ActionController(name: 'Edit_or_complete_profileState');

  @override
  void setSpinner() {
    final _$actionInfo = _$Edit_or_complete_profileStateActionController
        .startAction(name: 'Edit_or_complete_profileState.setSpinner');
    try {
      return super.setSpinner();
    } finally {
      _$Edit_or_complete_profileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
Spinner: ${Spinner}
    ''';
  }
}
