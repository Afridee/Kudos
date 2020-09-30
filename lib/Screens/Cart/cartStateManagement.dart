import 'package:kudos/Screens/loginPages/firebase_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:mobx/mobx.dart';

part 'cartStateManagement.g.dart';

class cartStateClass = cartState with _$cartStateClass;

abstract class cartState with Store{

  @observable
  String userID = '';

  @observable
  double totalCost = 0.0;

  @action
  getUserID(BuildContext context) async{
    final auth  = Provider.of<FirebaseAuthService>(context, listen: false);
    await auth.getCurrentUserUID();
  }

  @action
  void updateTotalCost(String act,double amount){
    if(act=='add'){
      totalCost = totalCost + amount;
    }else if(act=='deduct'){
      totalCost = totalCost - amount;
    }
  }

}