import 'package:mobx/mobx.dart';
part 'homeStateManagement.g.dart';

class homeStateClass = homeState with _$homeStateClass;

abstract class homeState with Store{

  @observable
  String title = 'Medicine Strore';

  @observable
  String category = 'Burgers';

  @action
  void setCategory(int i){

      switch (i) {
        case 0:
        category = 'Burgers';
          break;
        case 1:
        category = 'Sandwiches';
          break;
        case 2:
        category = 'Snacks';
          break;
        case 3:
        category = 'Drinks';
          break;
        case 4:
         category = 'Add-ons';
          break;
      }
  }

  @action
  void setTitlse(int i){
    switch(i) {
      case 0: {  title = 'Set Doctor Appointment'; }
      break;

      case 1: {  title = 'Our Menu'; }
      break;

      case 2: {  title = 'Cart'; }
      break;
    }
  }

}
