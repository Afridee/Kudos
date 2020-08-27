// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeStateManagement.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$homeStateClass on homeState, Store {
  final _$titleAtom = Atom(name: 'homeState.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$categoryAtom = Atom(name: 'homeState.category');

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$custom_IconAtom = Atom(name: 'homeState.custom_Icon');

  @override
  Icon get custom_Icon {
    _$custom_IconAtom.reportRead();
    return super.custom_Icon;
  }

  @override
  set custom_Icon(Icon value) {
    _$custom_IconAtom.reportWrite(value, super.custom_Icon, () {
      super.custom_Icon = value;
    });
  }

  final _$search_textAtom = Atom(name: 'homeState.search_text');

  @override
  Widget get search_text {
    _$search_textAtom.reportRead();
    return super.search_text;
  }

  @override
  set search_text(Widget value) {
    _$search_textAtom.reportWrite(value, super.search_text, () {
      super.search_text = value;
    });
  }

  final _$searchQueryAtom = Atom(name: 'homeState.searchQuery');

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  final _$homeStateActionController = ActionController(name: 'homeState');

  @override
  void seacrchIconState() {
    final _$actionInfo = _$homeStateActionController.startAction(
        name: 'homeState.seacrchIconState');
    try {
      return super.seacrchIconState();
    } finally {
      _$homeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(int i) {
    final _$actionInfo =
        _$homeStateActionController.startAction(name: 'homeState.setCategory');
    try {
      return super.setCategory(i);
    } finally {
      _$homeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitlse(int i) {
    final _$actionInfo =
        _$homeStateActionController.startAction(name: 'homeState.setTitlse');
    try {
      return super.setTitlse(i);
    } finally {
      _$homeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
category: ${category},
custom_Icon: ${custom_Icon},
search_text: ${search_text},
searchQuery: ${searchQuery}
    ''';
  }
}
