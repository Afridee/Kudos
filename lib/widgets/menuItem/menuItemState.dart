import 'package:mobx/mobx.dart';

part 'menuItemState.g.dart';

class listStateClass = listElementState with _$listStateClass;

abstract class listElementState with Store{

  @observable
  int qty = 0;

  @action
  void add(){
    qty++;
  }

  @action
  void deduct(){
    if(qty>0){
      qty--;
    }
  }
}