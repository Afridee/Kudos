// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartStateManagement.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$cartStateClass on cartState, Store {
  final _$userIDAtom = Atom(name: 'cartState.userID');

  @override
  String get userID {
    _$userIDAtom.reportRead();
    return super.userID;
  }

  @override
  set userID(String value) {
    _$userIDAtom.reportWrite(value, super.userID, () {
      super.userID = value;
    });
  }

  final _$totalCostAtom = Atom(name: 'cartState.totalCost');

  @override
  double get totalCost {
    _$totalCostAtom.reportRead();
    return super.totalCost;
  }

  @override
  set totalCost(double value) {
    _$totalCostAtom.reportWrite(value, super.totalCost, () {
      super.totalCost = value;
    });
  }

  final _$itemSpinnerAtom = Atom(name: 'cartState.itemSpinner');

  @override
  bool get itemSpinner {
    _$itemSpinnerAtom.reportRead();
    return super.itemSpinner;
  }

  @override
  set itemSpinner(bool value) {
    _$itemSpinnerAtom.reportWrite(value, super.itemSpinner, () {
      super.itemSpinner = value;
    });
  }

  final _$getUserIDAsyncAction = AsyncAction('cartState.getUserID');

  @override
  Future getUserID(BuildContext context) {
    return _$getUserIDAsyncAction.run(() => super.getUserID(context));
  }

  final _$cartStateActionController = ActionController(name: 'cartState');

  @override
  void updateTotalCost(String act, double amount) {
    final _$actionInfo = _$cartStateActionController.startAction(
        name: 'cartState.updateTotalCost');
    try {
      return super.updateTotalCost(act, amount);
    } finally {
      _$cartStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetItemSpinner() {
    final _$actionInfo = _$cartStateActionController.startAction(
        name: 'cartState.resetItemSpinner');
    try {
      return super.resetItemSpinner();
    } finally {
      _$cartStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userID: ${userID},
totalCost: ${totalCost},
itemSpinner: ${itemSpinner}
    ''';
  }
}
