import 'dart:async';

import 'package:mobx/mobx.dart';

part 'states.g.dart';

class Edit_or_complete_profileStateClass = Edit_or_complete_profileState with _$Edit_or_complete_profileStateClass;

abstract class Edit_or_complete_profileState with Store{

  @observable
  bool Spinner = false;

  @action
  void setSpinner() {
    Timer(Duration(seconds: 5), () {
      Spinner = !Spinner;
    });
    Spinner = !Spinner;
  }
}