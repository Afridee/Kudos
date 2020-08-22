// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuItemState.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$listStateClass on listElementState, Store {
  final _$qtyAtom = Atom(name: 'listElementState.qty');

  @override
  int get qty {
    _$qtyAtom.reportRead();
    return super.qty;
  }

  @override
  set qty(int value) {
    _$qtyAtom.reportWrite(value, super.qty, () {
      super.qty = value;
    });
  }

  final _$listElementStateActionController =
      ActionController(name: 'listElementState');

  @override
  void add() {
    final _$actionInfo = _$listElementStateActionController.startAction(
        name: 'listElementState.add');
    try {
      return super.add();
    } finally {
      _$listElementStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deduct() {
    final _$actionInfo = _$listElementStateActionController.startAction(
        name: 'listElementState.deduct');
    try {
      return super.deduct();
    } finally {
      _$listElementStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
qty: ${qty}
    ''';
  }
}
