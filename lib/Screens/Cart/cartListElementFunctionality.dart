import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> add(DocumentReference item) async{

  int qty;

  try{
    await item.get().then((doc) {
      qty = doc.data['qty'];
    });

    await item.setData({
      'qty' : qty+1
    }, merge: true);

    return true;
  }catch(e){
    return false;
  }
}

Future<bool> remove(DocumentReference item) async{

  int qty;

  try{
    await item.get().then((doc) {
      qty = doc.data['qty'];
    });

    if(qty<=1){
      item.delete();
    }else{
      await item.setData({
        'qty' : qty-1
      }, merge: true);
    }

    return true;
  }catch(e){
    return false;
  }
}